-- https://github.com/folke/which-key.nvim

-- Mappings are usually defined in the individual plugin files, however we still need to give a name
-- to the mappings groups, and define plugin independent mappings.
-- Hence this small configuration script.

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = "modern",
    win = {
      border = "single", -- none, single, double, shadow
    },
    icons = {
      group = "󰉋 ",
      colors = false,
    },
    spec = {
      { "<leader>d", group = "Diagnostics" },
      { "<leader>f", group = "Find" },
      { "<leader>h", group = "Harpoon" },



      { "<leader>l", group = "LSP", },
      { "<leader>lh", vim.lsp.buf.hover,          desc = "Hint" },
      { "<leader>ld", vim.lsp.buf.definition,     desc = "Go to definition" },
      { "<leader>li", vim.lsp.buf.implementation, desc = "Implementation" },
      { "<leader>lm", vim.lsp.buf.references,     desc = "References" }, -- 'm' for 'mentions'.
      { "<leader>lc", vim.lsp.buf.incoming_calls, desc = "Calls" },
      { "<leader>lr", vim.lsp.buf.rename,         desc = "Rename" },



      { "<leader>p", group = "Packages", },
      { "<leader>pp", "<cmd>Lazy<cr>", desc = "Plugins" },



      { "<leader>w", "<cmd>write<cr>", desc = "Write file" },
      { "<leader>q", "<cmd>quit<cr>", desc = "Quit file" },



      { "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
      { "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },
    },
  },
  -- config = make_config,
}

