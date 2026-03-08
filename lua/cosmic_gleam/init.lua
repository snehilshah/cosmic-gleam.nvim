require 'cosmic_gleam.palettes.dark'
local M = {}

function M.setup()
  vim.api.nvim_create_user_command('Hello', function()
    print 'Hello, Welome to my theme'
  end, {})
end

return M
