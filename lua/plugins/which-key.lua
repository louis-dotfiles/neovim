-- https://github.com/folke/which-key.nvim

-- Mappings are usually defined in the individual plugin files, however we still need to give a name
-- to the mappings groups, and define plugin independent mappings.
-- Hence this small configuration script.
local function make_config()
  local wk = require("which-key")

  wk.register({
    d = { name = "Diagnostics" },
    f = { name = "Find" },
    h = { name = "Harpoon" },
    l = {
      name = "LSP",
      -- Information.
      h = { vim.lsp.buf.hover, "Hint" }, -- For regular code.
      -- s = { vim.lsp.buf.signature_help, "Signature" }, -- vim.lsp.buf.hover does it better imo.

      -- Movement.
      d = { vim.lsp.buf.definition, "Go to definition" },
      i = { vim.lsp.buf.implementation, "Implementation" },
      m = { vim.lsp.buf.references, "References" }, -- 'm' for 'mentions'.
      c = { vim.lsp.buf.incoming_calls, "Calls" },
      -- t = { vim.lsp.buf.type_definition, "Type definition" }, -- vim.lsp.buf.definition does it too.
      -- Actions.
      r = { vim.lsp.buf.rename, "Rename" },
    },
    p = {
      name = "Packages",
      p = { "<cmd>Lazy<cr>", "Plugins" },
    },
    w = { "<cmd>write<cr>", "Write file" },
    q = { "<cmd>quit<cr>", "Quit file" },
  }, { prefix = "<Leader>" })

  wk.register({
    ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
  })

  wk.setup({
    window = {
      border = "single", -- none, single, double, shadow
    },
    icons = {
      group = "󰉋 ",
    },
  })
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = make_config,
}
