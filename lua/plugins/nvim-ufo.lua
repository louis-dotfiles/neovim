-- https://github.com/kevinhwang91/nvim-ufo

local function make_config(_, opts)
  vim.o.foldcolumn = '1' -- '0' is not bad
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  require("ufo").setup(opts)
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",
  opts = {},
  config = make_config,
  enabled = false, -- Fix the status column first.
}

