-- stylua: ignore start

local hsl = require("cosmic_gleam.helpers.hsl").hsl

-- Define the base palette using hex codes to convert to HSL objects initially.
-- Once converted, you can manipulate them like: `bg:lighten(10)` or `fg:darken(20)`
local p = {
  a = {
    bg      = hsl(0, 0, 95),
    float   = hsl(26, 24, 89),
    sel     = hsl(27, 13, 83),
    ui      = hsl(22, 22, 57),
    com     = hsl(23, 17, 42),
    fg      = hsl(21, 18, 28),
  },
  b = {
    red     = hsl(350, 100, 37),
    yellow  = hsl(41, 100, 31),
    green   = hsl(141, 28, 32),
    cyan    = hsl(184, 26, 32),
    blue    = hsl(227, 40, 46),
    magenta = hsl(312, 38, 41),
  },
  c = {
    red     = hsl(347, 40, 63),
    yellow  = hsl(29, 100, 37),
    green   = hsl(125, 18, 52),
    cyan    = hsl(180, 15, 52),
    blue    = hsl(217, 34, 61),
    magenta = hsl(303, 35, 61),
  },
  d = {
    red     = hsl(357, 40, 91),
    yellow  = hsl(31, 45, 64),
    green   = hsl(122, 36, 86),
    cyan    = hsl(178, 37, 86),
    blue    = hsl(225, 15, 89),
    magenta = hsl(300, 15, 89),
  },
  git = {
    add_bg       = hsl(127, 24, 93), -- Very light green
    add_emph_bg  = hsl(128, 28, 79), -- Softer medium green char bg
    del_bg       = hsl(6, 70, 95),   -- Very light red
    del_emph_bg  = hsl(2, 67, 82),   -- Softer medium red char bg
    chg_bg       = hsl(220, 23, 95), -- Very light blue
    chg_emph_bg  = hsl(222, 25, 79), -- Softer medium blue char bg
    emph_fg      = hsl(21, 18, 28),  -- Gruvbox a.fg (Normal char fg, no longer inverted)
    filler       = hsl(23, 17, 42),  -- Gruvbox a.com
  },
}

return p
