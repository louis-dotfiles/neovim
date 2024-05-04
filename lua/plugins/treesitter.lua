-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#lazynvim

local function make_config()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = {
      "bash",
      "css",
      "csv",
      "gitcommit",
      "gitignore",
      "go",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "nix",
      "python",
      "scss",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },

    highlight = {
      enable = true,
      -- Disable highlighting for very large files.
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },

    indent = { enable = true },
  })

  -- Folding.
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldenable = false
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = make_config,
}

