-- https://github.com/nvim-lualine/lualine.nvim

---Simply displays which LSP are attached to the current buffer.
---e.g.  lua_ls
---
---@return string
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


---Returns a visual indication of the search position and total results.
---e.g. 
---
---@return string
local function search_count_module()
  if vim.v.hlsearch ~= 1 then return '' end

  local icon = " "
  local search_info = vim.fn.searchcount({ maxcount = 0 })

  if search_info.incomplete == 1 then
    return icon .. ''
  end

  local total_char_length = string.len(search_info.total)
  local text = icon .. string.format('%0' .. total_char_length .. 'd/%d', search_info.current, search_info.total)

  return text
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
      lualine_z = { search_count_module, "progress" },
    },
  },
}

