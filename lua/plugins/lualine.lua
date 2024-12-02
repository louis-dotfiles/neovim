-- https://github.com/nvim-lualine/lualine.nvim

-- Simply displays which LSP are attached to the current buffer.
local function lsp_module()
  local lsp_clients = vim.lsp.get_clients({ bufnr = 0 })

  -- Aliases for LSPs with long names.
  local shortnames = {
    jedi_language_server = "jedi",
  }

  if #lsp_clients == 0 then
    return "󰒲 "
  end

  local client_names = vim.tbl_map(
    function(item) return shortnames[item.name] or item.name end,
    vim.tbl_values(lsp_clients)
  )

  return " " .. table.concat(client_names, "|")
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
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icon = "" },
        "diff",
      },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = ' ',
            warn = ' ',
            hint = '󰌵 ',
            info = ' ',
          },
        },
      },

      -- Right side.
      lualine_x = { "harpoon2" },
      lualine_y = { "filetype", lsp_module },
      lualine_z = { "progress" },
    },
  },
}

