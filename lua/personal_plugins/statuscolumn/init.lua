local line_number_col = require("personal_plugins.statuscolumn.line-number-col")
local gitsign_col = require("personal_plugins.statuscolumn.gitsign-col")
local diagnostics_col = require("personal_plugins.statuscolumn.diagnostic-col")


local function is_excluded_filetype(buffer_number)
  local excluded_filetypes = {
    "neo-tree",
    "help",
    "lazy",
  }

  return vim.tbl_contains(excluded_filetypes, vim.bo[buffer_number].filetype)
end


---@class Context
---@field cursor_buffer number
---@field cursor_line number
---@field draw_buffer number
---@field lnum number
---@field relnum number
---@field win_id number
---@field changedtick number
---@field vim_mode string
---@field is_cursor_line boolean
---@field is_current_buffer boolean


---Gathers a bunch of useful information for generating a statuscolumn.
---@return Context
local function get_context()
  local draw_buffer = vim.api.nvim_win_get_buf(vim.g.statusline_winid)

  local context = {
    -- I know it's deprecated. I don't know what the correct "new" way to do it is though.
    cursor_buffer = vim.api.nvim_buf_get_number(0),
    cursor_line = unpack(vim.api.nvim_win_get_cursor(0)),

    draw_buffer = draw_buffer,
    lnum = vim.v.lnum,
    relnum = vim.v.relnum,

    win_id = vim.api.nvim_get_current_win(),
    changedtick = vim.api.nvim_buf_get_changedtick(draw_buffer),
    vim_mode = vim.api.nvim_get_mode().mode,
  }

  local is_cursor_line = context.lnum == context.cursor_line
  local is_current_buffer = context.draw_buffer == context.cursor_buffer

  context.is_cursor_line = is_cursor_line
  context.is_current_buffer = is_current_buffer

  return context
end


-- This needs to be a global function for the statuscolumn to be able to call it.
function Generate_statuscolumn()
  local context = get_context()
  local buffer_number = vim.api.nvim_win_get_buf(vim.g.statusline_winid)

  if is_excluded_filetype(buffer_number) then
    return ""
  end

  -- :help statuscolumn
  -- :help statusline
  local components = {
    diagnostics_col.generate(context),
    -- Switch alignment. i.e. Segments above are aligned to the left. Segments below are aligned to the right.
    '%=',
    line_number_col.generate(context),
    -- Just some spacing before the buffer.
    ' ',
    gitsign_col.generate(context),
  }

  return table.concat(components)
end

vim.opt.statuscolumn = "%!v:lua.Generate_statuscolumn()"

