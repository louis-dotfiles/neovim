-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
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
  },
  cmd = {
    "Telescope",
  },
}

