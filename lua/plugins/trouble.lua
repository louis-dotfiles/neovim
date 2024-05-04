-- https://github.com/folke/trouble.nvim

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<Leader>dd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Document diagnostics",
    },
    {
      "<Leader>dw",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Workspace diagnostics",
    },
    {
      "<Leader>dc",
      "<cmd>TroubleClose<cr>",
      desc = "Close diagnostics",
    },
  },
}
