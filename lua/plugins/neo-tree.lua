-- https://github.com/nvim-neo-tree/neo-tree.nvim

local function make_config(_, opts)
  local components = require('neo-tree.sources.common.components')

  -- Super complicated way to set the root node name as something legible (i.e. not the relative path from $HOME, while marginally better than an absolute path, it can still be VERY long and the tail is NOT visible.)
  local name_component = function(config, node, state)
    local result = components.name(config, node, state)
    if node:get_depth() == 1 and node.type ~= "message" then
      result.text = vim.fn.fnamemodify(node.path, ":t")
    end
    return result
  end
  opts.filesystem.components.name = name_component

  require("neo-tree").setup(opts)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    default_component_configs = {
      diagnostics = {
        symbols = {
          error = "",
          warn = "",
          hint = "󰌵",
          info = "",
        },
      },
    },
    source_selector = {
      winbar = true,
      statusline = false,
      show_scrolled_off_parent_node = false,
      sources = {
        {
          source = "filesystem",
          display_name = " 󰉓 Files ",
        },
        {
          source = "buffers",
          display_name = " 󰈚 Buffers ",
        },
        {
          source = "git_status",
          display_name = " 󰊢 Git "
        },
      },
      content_layout = "start",
      tabs_layout = "equal",
      truncation_character = "…",
      tabs_min_width = nil,
      tabs_max_width = nil,
      padding = 0,
      separator = { left = "▏", right= "▕" },
      separator_active = nil,
      show_separator_on_edge = false,
      highlight_tab = "NeoTreeTabInactive",
      highlight_tab_active = "NeoTreeTabActive",
      highlight_background = "NeoTreeTabInactive",
      highlight_separator = "NeoTreeTabSeparatorInactive",
      highlight_separator_active = "NeoTreeTabSeparatorActive",
    },
    filesystem = {
      window = {
        mappings = {
          ["l"] = "open",
          ["L"] = "open_vsplit",
          ["h"] = "close_node",
          ["C"] = "close_all_nodes",
          ["<C-h>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
        }
      },
      components = {},
    },
  },
  config = make_config,
  keys = {
    {
      "<Leader>e",
      "<cmd>Neotree filesystem toggle left<cr>",
      desc = "File explorer",
    },
  },
}

