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


---Returns a visual indication of the visual selection.
---e.g. 󰒉 3l
---e.g. 󰒉 -11c
---e.g. 󰒉 3l x 2c
---
---@return string
local function visual_selection_module()
  local mode = vim.api.nvim_get_mode().mode

  local active_modes = { "v", "V", "" }
  if not vim.tbl_contains(active_modes, mode) then return "" end

  local icon = "󰒉 "
  local _, line_start, col_start = unpack(vim.fn.getpos("v"))
  local _, line_end, col_end = unpack(vim.fn.getpos("."))

  local line_diff = line_end - line_start
  local col_diff = col_end - col_start

  local line_count = line_diff >= 0 and line_diff + 1 or line_diff - 1
  local col_count = col_diff >= 0 and col_diff + 1 or col_diff - 1

  local text = ""
  if mode == "v" then
    -- print("charwise")
    if line_diff ~= 0 then
      text = tostring(line_count) .. "l"
    else
      text = tostring(col_count) .. "c"
    end
  elseif mode == "V" then
    -- print("linewise")
    text = tostring(line_count) .. "l"
  else
    -- print("blockwise?")
    text = line_count .. "l x " .. col_count .. "c"
  end

  return icon .. text
end


---Returns a visual indication of the search position and total results.
---e.g. 
---
---@return string
local function search_count_module()
  if vim.v.hlsearch ~= 1 then return '' end

  local icon = " "
  local search_info = vim.fn.searchcount({ maxcount = 0 })

  local text = ''
  if search_info.incomplete == 1 then
    text = ''
  else
    local total_char_length = string.len(search_info.total)
    text = string.format('%0' .. total_char_length .. 'd/%d', search_info.current, search_info.total)
  end

  return icon .. text
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
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
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
      lualine_z = { visual_selection_module, search_count_module, "progress" },
    },
  },
}

