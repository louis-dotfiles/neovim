-- https://github.com/nvim-telescope/telescope.nvim

local function make_config(_, opts)
  local telescope = require("telescope")

  -- Load extensions here.

  telescope.setup(opts)
end



return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      mappings = {
        i = {
          -- Unmap the default <C-u> telescope mapping so that I can clear the prompt.
          ["<C-u>"] = false,
        },
      },
    },
  },
  config = make_config,
  keys = {
    {
      "<Leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Files",
    },
    {
      "<Leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Grep",
    },
    { -- This one is useful when you don't recall the name of the files you opened.
      "<Leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
    },
    {
      "<Leader>fk",
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
    },
    {
      "<Leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Help",
    },
    {
      "<Leader>fc",
      "<cmd>Telescope highlights<cr>",
      desc = "Colors (highlight groups)",
    },
    {
      "<Leader>fr",
      "<cmd>Telescope registers<cr>",
      desc = "Registers",
    },
    {
      "<Leader>fn",
      "<cmd>Telescope notify<cr>",
      desc = "Notifications",
    },
  },
  cmd = {
    "Telescope",
  },
}

