
local M = {}


---@class GroupedSigns
---@field git_signs table<number, vim.api.keyset.extmark_details[]>
---@field diagnostic_signs table<number, vim.api.keyset.extmark_details[]>

---It looks like the Neovim lua type annotations are incorrect. Let's fix them.
---@class Sign: vim.api.keyset.get_extmark_item
---@field [4] vim.api.keyset.extmark_details


---Returns all signs across all namespaces in the current buffer.
---I don't know of any reliable way to only find diagnostic signs.
---(But I do know how to find the gitsign ones).
---@param namespace_id? number
---@return Sign[]
function M.get_signs_from_extmarks(namespace_id)
  -- This is the buffer number of the buffer we are currently drawing the statuscolumn for.
  local buffer_number = vim.api.nvim_win_get_buf(vim.g.statusline_winid)

  return vim.api.nvim_buf_get_extmarks(
    buffer_number,  -- Current buffer.
    namespace_id or -1,
    0,  -- First line and column.
    -1, -- Last line and column.
    {
      type = "sign",
      details = true,
    }
  )
end


---Groups signs by their type and line number for easy access.
---@param signs Sign[]
---@return GroupedSigns
local function group_sign_details_by_categories_and_lines(signs)
  local gitsign_hl_groups = {
    "GitSignsAdd",
    "GitSignsChange",
    "GitSignsDelete",
  }
  local diagnostic_hl_groups = {
    "DiagnosticSignError",
    "DiagnosticSignWarn",
    "DiagnosticSignHint",
    "DiagnosticSignInfo",
  }
  local git_signs = {}
  local diagnostic_signs = {}

  for _, sign in pairs(signs) do
    -- + 1 because extmarks are 0 based, while line numbers are 1 based.
    -- :help api-indexing
    local line_number = sign[2] + 1
    local sign_detail = sign[4]

    if vim.tbl_contains(gitsign_hl_groups, sign_detail.sign_hl_group) then
      if not git_signs[line_number] then
        git_signs[line_number] = {}
      end

      table.insert(git_signs[line_number], sign_detail)

    elseif vim.tbl_contains(diagnostic_hl_groups, sign_detail.sign_hl_group) then
      if not diagnostic_signs[line_number] then
        diagnostic_signs[line_number] = {}
      end

      table.insert(diagnostic_signs[line_number], sign_detail)
    end
  end

  return {
    git_signs = git_signs,
    diagnostic_signs = diagnostic_signs,
  }
end


---comment
---@return GroupedSigns
local function get_grouped_signs()
  local all_signs = M.get_signs_from_extmarks()
  local grouped_signs = group_sign_details_by_categories_and_lines(all_signs)

  return grouped_signs
end


---Returns the git signs grouped by line number.
---There will always be only one sign for a given line number.
---@return table<number, vim.api.keyset.extmark_details[]>
function M.get_git_sign_details()
  return get_grouped_signs().git_signs
end


---Returns the diagnostic signs grouped by line number.
---There may be multiple signs for a given line number.
---@return table<number, vim.api.keyset.extmark_details[]>
function M.get_diagnostic_sign_details()
  return get_grouped_signs().diagnostic_signs
end


return M

