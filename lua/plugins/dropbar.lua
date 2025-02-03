-- https://github.com/Bekaboo/dropbar.nvim


return {
  "Bekaboo/dropbar.nvim",
  opts = {
    bar = {
      hover = false,
      pick = {
        pivots = '123456',
      },
    },
    menu = {
      hover = false,
      win_configs = {
        border = "rounded",
      },
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "<Leader>;",
      function() require('dropbar.api').pick() end,
      desc = "Pick symbols in winbar",
    },
    {
      "[;",
      function() require('dropbar.api').goto_context_start() end,
      desc = "Go to start of current context",
    },
    {
      "];",
      function() require('dropbar.api').select_next_context() end,
      desc = "Select next context",
    },
  },
}

