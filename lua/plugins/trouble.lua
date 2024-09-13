-- https://github.com/folke/trouble.nvim

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    warn_no_results = false,
    open_no_results = true,
  },
  keys = {
    {
      "<Leader>dd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Document diagnostics",
    },
    {
      "<Leader>dw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workspace diagnostics",
    },
    {
      "<Leader>dc",
      "<cmd>Trouble diagnostics close<cr>",
      desc = "Close diagnostics",
    },
  },
}
