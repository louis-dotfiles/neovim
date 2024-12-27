-- https://github.com/nvim-telescope/telescope.nvim

local function make_config(_, opts)
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local action_state = require "telescope.actions.state"
  local trouble_actions = require("trouble.sources.telescope")

  -- This is a custom "delete buffer" function because it could be used with
  -- other pickers (e.g. Find file) and this results in ugly errors.
  local function delete_buffer(prompt_bufnr)
    local current_picker = action_state.get_current_picker(prompt_bufnr)

    if current_picker.prompt_title == "Buffers" then
      actions.delete_buffer(prompt_bufnr)
    end
  end

  opts.defaults.mappings = {
    i = {
      -- Unmap the default <C-u> telescope mapping so that I can clear the
      -- prompt.
      ["<C-u>"] = false,
      ["<C-h>"] = actions.select_horizontal,

      ["<C-d>"] = delete_buffer,
      ["<C-a>"] = trouble_actions.add,
      ["<C-s>"] = trouble_actions.open, -- "s" for "save".
    },
    n = {
      ["<C-a>"] = trouble_actions.add,
      ["<C-s>"] = trouble_actions.open, -- "s" for "save".
    },
  }

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

