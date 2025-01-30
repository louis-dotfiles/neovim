-- https://github.com/OXY2DEV/markview.nvim

local function make_config(_, opts)
  require("markview").setup(opts)

  -- Only option to disable Markview by default :( .
  vim.cmd("Markview disable")
end

return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- As per the installation instructions.
  -- ft = "markdown" -- If you decide to lazy-load anyway.

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  config = make_config,
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

