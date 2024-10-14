-- https://github.com/nvim-lualine/lualine.nvim

-- TODO: doesn't update properly when changing buffers?
local function lsp_module()
  local lsp_clients = vim.lsp.get_clients({ bufnr = 0 })

  if #lsp_clients == 0 then
    return "󰒲 "
  end

  local client_names = vim.tbl_map(
    function(item) return item.name end,
    vim.tbl_values(lsp_clients)
  )

  return "  " .. table.concat(client_names, '|')
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    {
      "letieu/harpoon-lualine",
      dependencies = { "ThePrimeagen/harpoon", branch = "harpoon2" },
    },
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sections = {
      -- Left side.
      lualine_a = {"mode"},
      lualine_b = {
        { "branch", icon = "" },
        "diff",
      },
      lualine_c = { "diagnostics" },

      -- Right side.
      lualine_x = { "harpoon2" },
      lualine_y = { "filetype", lsp_module },
      lualine_z = {"progress"},
    },
  },
}

