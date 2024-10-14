-- https://github.com/chrishrb/gx.nvim

return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function ()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  submodules = false, -- Submodules are required only for tests.
  opts = {
    handler_options = {
      search_engine = "ecosia"
    },
  },
  keys = {
    {
      "gx",
      "<cmd>Browse<cr>",
      mode = { "n", "x" },
    },
  },
  cmd = { "Browse" },
}

