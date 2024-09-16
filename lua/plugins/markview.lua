-- https://github.com/OXY2DEV/markview.nvim

return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- As per the installation instructions.
  -- ft = "markdown" -- If you decide to lazy-load anyway.

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    modes = {},
  },
  keys = {
    {
      "<Leader>mm",
      "<cmd>Markview toggle<cr>",
      desc = "Preview",
    },
    {
      "<Leader>ms",
      "<cmd>Markview splitToggle<cr>",
      desc = "Split preview",
    },
  },
}

