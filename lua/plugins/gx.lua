-- https://github.com/chrishrb/gx.nvim

return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function ()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  opts = {},
  keys = {
    {
      "gx",
      "<cmd>Browse<cr>",
      mode = { "n", "x" },
    },
  },
  cmd = { "Browse" },
}

