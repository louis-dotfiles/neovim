-- https://github.com/stevearc/aerial.nvim

return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    autojump = true,
    show_guides = true,
  },
  keys = {
    { "<Leader>o", "<cmd>AerialToggle!<CR>", desc = "Code Outline" },
  },
}

