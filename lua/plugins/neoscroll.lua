-- https://github.com/karb94/neoscroll.nvim

local function make_config()
  local neoscroll = require('neoscroll')

  neoscroll.setup({})

  local keymap = {
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 50 }) end;
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 50 }) end;
    ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 50 }) end;
    ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 50 }) end;
  }

  local modes = { 'n', 'v', 'x' }
  for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
  end
end

return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opt = {
    hide_cursor = false,
    respect_scrolloff = true,
  },
  config = make_config,
  -- enabled = false,
}

