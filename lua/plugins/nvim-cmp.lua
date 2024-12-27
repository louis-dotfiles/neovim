-- https://github.com/hrsh7th/nvim-cmp
--
-- More completion sources:
-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources

local function make_config()
  local cmp = require("cmp")

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine.
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = vim.tbl_extend(
        "force",
        cmp.config.window.bordered(),
        {
          scrolloff = 3,
        }
      ),
      documentation = cmp.config.window.bordered(),
    },
    -- :help cmp-mapping
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(), -- Show cmp menu.
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm({ -- Accept completion.
        behavior = cmp.ConfirmBehavior.Replace,
      }),
    }),
    sources = cmp.config.sources(
      {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
      { { name = "buffer" } }
    )
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })

  -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      { { name = "path" } },
      { { name = "cmdline" } }
    ),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
end

return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = make_config,
}

