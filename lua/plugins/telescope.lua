-- https://github.com/nvim-telescope/telescope.nvim

local function make_config(_, opts)
  local telescope = require("telescope")

  -- Load extensions here.

  telescope.setup(opts)
end



return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
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
      "<Leader>fn",
      "<cmd>Telescope notify<cr>",
      desc = "Notifications",
    },
  },
  cmd = {
    "Telescope",
  },
}

