local bg = vim.opt.background:get()
local palette = require("cosmic_gleam/palettes/" .. bg)
local grays = palette.a
local bright = palette.b
local normal = palette.c

local base = { bg = grays.float, fg = grays.com }
local inactive = { bg = grays.float, fg = grays.com }

local function mode(mode_bg, accent)
  return {
    a = { bg = mode_bg, fg = grays.float, gui = "bold" },
    b = { bg = grays.sel, fg = accent },
    c = base,
    x = base,
    y = { bg = grays.sel, fg = accent },
    z = { bg = mode_bg, fg = grays.float, gui = "bold" },
  }
end

local function to_hex(t)
  if type(t) ~= "table" then
    return t
  end
  if t.to_hex then
    return t:to_hex()
  end
  local res = {}
  for k, v in pairs(t) do
    res[k] = to_hex(v)
  end
  return res
end

return to_hex({
  normal = mode(grays.com, grays.com),
  insert = mode(bright.yellow, normal.yellow),
  replace = mode(bright.red, normal.red),
  command = mode(bright.cyan, normal.cyan),
  terminal = mode(bright.green, normal.green),
  visual = mode(bright.magenta, normal.magenta),
  inactive = { a = inactive, b = inactive, c = inactive, x = inactive, y = inactive, z = inactive },
})
