-- https://github.com/nvim-tree/nvim-tree.lua

local function make_config()
  -- Define the mappings for nvim-tree.
  -- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#custom-mappings
  local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
      end
    end

    -- open as vsplit on current node
    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file as vsplit
        api.node.open.vertical()
      end

      -- Finally refocus on tree if it was lost
      api.tree.focus()
    end

    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- l/L to open folders and files.
    vim.keymap.set("n", "l", edit_or_open,   opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    -- h/H to close folders.
    vim.keymap.set("n", "h", api.node.navigate.parent,       opts("Close"))
    vim.keymap.set("n", "H", api.node.navigate.parent_close, opts("Close"))

    vim.keymap.set("n", "c", api.tree.collapse_all,          opts("Collapse All"))
  end

  require("nvim-tree").setup({
    on_attach = on_attach,
    hijack_cursor = true,
    disable_netrw = true,
    renderer = {
      add_trailing = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          folder_arrow = false,
          git = false,
        },
      },
    },
    -- view = {
    --   signcolumn = "no",
    -- },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  config = make_config,
  keys = {
    {
      "<Leader>e",
      "<cmd>NvimTreeToggle<cr>",
      desc = "File explorer",
    },
  },
}

