-- https://github.com/aznhe21/actions-preview.nvim

return {
  "aznhe21/actions-preview.nvim",
  opts = {},
  keys = {
    {
      "<leader>la",
      function() require("actions-preview").code_actions() end,
      desc = "Actions",
    },
  },
}

