-- stylua: ignore start
local hsl = require("cosmic_gleam.helpers.hsl").hsl

-- Define the base palette using hex codes to convert to HSL objects initially.
-- Once converted, you can manipulate them like: `bg:lighten(10)` or `fg:darken(20)`
local p = {
  a = {
    bg      = hsl(0, 6, 12),
    float   = hsl(0, 6, 10),
    sel     = hsl(0, 0, 25),
    ui      = hsl(35, 12, 51),
    com     = hsl(35, 17, 59),
    fg      = hsl(35, 59, 81),
  },
  b = {
    red     = hsl(3, 76, 65),
    orange  = hsl(24, 76, 61),
    yellow  = hsl(37, 62, 59),
    green   = hsl(70, 36, 55),
    cyan    = hsl(112, 25, 61),
    blue    = hsl(167, 23, 59),
    magenta = hsl(344, 47, 68),
  },
  c = {
    red     = hsl(3, 76, 65),
    orange  = hsl(24, 76, 61),
    yellow  = hsl(37, 62, 59),
    green   = hsl(70, 36, 55),
    cyan    = hsl(112, 25, 61),
    blue    = hsl(167, 23, 59),
    magenta = hsl(344, 47, 68),
  },
  d = {
    red     = hsl(3, 27, 28),
    yellow  = hsl(38, 26, 26),
    green   = hsl(124, 11, 27),
    cyan    = hsl(124, 11, 27),
    blue    = hsl(173, 13, 26),
    magenta = hsl(340, 14, 28),
  },
  git = {
    add_bg       = hsl(115, 34, 13), -- Deep/very dark green
    add_emph_bg  = hsl(111, 29, 26), -- Softer medium green char bg
    del_bg       = hsl(0, 51, 15), -- Deep/very dark red
    del_emph_bg  = hsl(359, 52, 28), -- Softer medium red char bg
    chg_bg       = hsl(210, 30, 15), -- Deep/very dark blue
    chg_emph_bg  = hsl(210, 44, 29), -- Softer medium blue char bg
    emph_fg      = hsl(43, 59, 81), -- Gruvbox a.fg (Normal char fg, no longer inverted)
    filler       = hsl(30, 12, 51), -- Gruvbox a.ui
  },
}

return p
