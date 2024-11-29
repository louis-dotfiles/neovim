-- https://github.com/nvim-telescope/telescope.nvim

local function get_visual()
  local _, line_start, column_start = unpack(vim.fn.getpos('v'))
  local _, line_end, column_end = unpack(vim.fn.getpos('.'))

  return vim.api.nvim_buf_get_text(
    0,
    line_start - 1,
    column_start - 1,
    line_end - 1,
    column_end,
    {}
  )
end

local function search_selection()
  local telescope_builtins = require("telescope.builtin")
  local actions = require("telescope.actions")

  local visual = get_visual()

  if vim.tbl_count(visual) > 1 then return end

  print(vim.inspect(visual))

  telescope_builtins.live_grep({
    additional_args = {},
  })
end

local function make_config(_, opts)
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  -- local add_to_trouble = require("trouble.sources.telescope").add
  -- local open_with_trouble = require("trouble.sources.telescope").open

  local function test(prompt_bufnr)
    print("prompt_bufnr", vim.inspect(prompt_bufnr))
    -- actions.delete_buffer(buffer_number)
    actions.delete_buffer(prompt_bufnr)
  end

  local common_mappings = {
    i = {
      ["<C-x>"] = test,
      -- ["<C-x>"] = "delete_buffer",
    }
  }

  local more_opts = {
    defaults = {
      mappings = {
        i = {
          -- CLear some default mappings.
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<C-x>"] = false,

          ["<C-h>"] = actions.select_horizontal,
          -- ["<C-t>"] = add_to_trouble,
        },
        n = {
          -- ["<C-t>"] = add_to_trouble,
        },
      },
    },
    pickers = {
      buffers = {
        mappings = common_mappings,
      },
      find_files = {
        mappings = common_mappings,
      },
      live_grep = {
        mappings = common_mappings,
      },
    },
  }

  -- Load extensions here.

  telescope.setup(vim.tbl_deep_extend("force", opts, more_opts))
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
    {
      "<Leader>fv",
      search_selection,
      mode = { "n", "v", },
      desc = "Visual selection",
    }
  },
  cmd = {
    "Telescope",
  },
}

