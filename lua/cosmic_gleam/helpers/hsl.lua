-- Support module to convert between HSL and RGB_HEX values
--
-- RGB -> HSL and HSL -> RGB adapted from
-- https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua

local math_helpers = require('cosmic_gleam.helpers.math')
local round = math_helpers.round
local clamp = math_helpers.clamp
local rgb_convert = require('cosmic_gleam.helpers.rgb')

local function hsl_to_rgb(hsl)
  local r, g, b
  local h, s, l = hsl.h, hsl.s, hsl.l

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    local function hue2rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    local q
    if l < 0.5 then
      q = l * (1 + s)
    else
      q = l + s - l * s
    end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return {
    r = round(r * 255),
    g = round(g * 255),
    b = round(b * 255),
  }
end

local function rgb_to_hsl(rgb)
  local r, g, b = rgb.r / 255, rgb.g / 255, rgb.b / 255

  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, s, l

  l = (max + min) / 2

  if max == min then
    h, s = 0, 0 -- achromatic
  else
    local d = max - min
    if l > 0.5 then
      s = d / (2 - max - min)
    else
      s = d / (max + min)
    end
    if max == r then
      h = (g - b) / d
      if g < b then
        h = h + 6
      end
    elseif max == g then
      h = (b - r) / d + 2
    elseif max == b then
      h = (r - g) / d + 4
    end
    h = h / 6
  end

  return { h = h, s = s, l = l }
end

local M = {}

local HSL = {}
HSL.__index = HSL

function HSL:lighten(amount)
  return M.hsl(self.h, self.s, clamp(self.l + amount, 0, 100))
end

function HSL:darken(amount)
  return M.hsl(self.h, self.s, clamp(self.l - amount, 0, 100))
end

function HSL:saturate(amount)
  return M.hsl(self.h, clamp(self.s + amount, 0, 100), self.l)
end

function HSL:desaturate(amount)
  return M.hsl(self.h, clamp(self.s - amount, 0, 100), self.l)
end

function HSL:to_hex()
  return M.hsl_to_hex(self)
end

M.hsl = function(h, s, l)
  local color = { h = tonumber(h) or 0, s = tonumber(s) or 0, l = tonumber(l) or 0 }
  setmetatable(color, HSL)
  return color
end

M.hex_to_hsl = function(hex)
  local rgb = rgb_convert.hex_to_rgb(hex)
  local hsl = rgb_to_hsl(rgb)
  return M.hsl(
    round(hsl.h * 360),
    round(hsl.s * 100),
    round(hsl.l * 100)
  )
end

M.hsl_to_hex = function(hsl)
  -- normalise for convert fuction
  local norm_hsl = {
    h = tonumber(hsl.h) / 360,
    s = tonumber(hsl.s) / 100,
    l = tonumber(hsl.l) / 100,
  }
  local rgb = hsl_to_rgb(norm_hsl)
  return rgb_convert.rgb_to_hex(rgb)
end

return M
