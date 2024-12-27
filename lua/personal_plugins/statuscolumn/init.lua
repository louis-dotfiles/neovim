local line_number_col = require("personal_plugins.statuscolumn.line-number-col")
local gitsign_col = require("personal_plugins.statuscolumn.gitsign-col")
local diagnostics_col = require("personal_plugins.statuscolumn.diagnostic-col")


---Decides if the statusbar should be drawn for the buffer that's being drawn by Neovim.
---
---@param context Context
---@return boolean
local function is_excluded_filetype(context)
  local excluded_filetypes = {
    "neo-tree",
    "help",
    "lazy",
  }

  return vim.tbl_contains(excluded_filetypes, vim.bo[context.draw_buffer].filetype)
end


---General "context" container with pretty much all of the information you want
---to draw the statuscolumn.
---
---@class Context
---@field cursor_win_id number
---@field cursor_buffer number
---@field cursor_line number
---@field draw_win_id number
---@field draw_buffer number
---@field lnum number
---@field relnum number
---@field virtnum number
---@field changedtick number
---@field vim_mode string
---@field is_cursor_line boolean
---@field is_current_buffer boolean
---@field is_current_window boolean


---Gathers a bunch of useful information for generating a statuscolumn.
---
---@return Context
local function get_context()
  local draw_buffer = vim.api.nvim_win_get_buf(vim.g.statusline_winid)

  local context = {
    -- I know it's deprecated. I don't know what the correct "new" way to do it is though.
    cursor_win_id = vim.api.nvim_get_current_win(),
    cursor_buffer = vim.api.nvim_buf_get_number(0),
    cursor_line = unpack(vim.api.nvim_win_get_cursor(0)),

    draw_win_id = vim.g.statusline_winid,
    draw_buffer = draw_buffer,
    lnum = vim.v.lnum,
    relnum = vim.v.relnum,
    virtnum = vim.v.virtnum,

    changedtick = vim.api.nvim_buf_get_changedtick(draw_buffer),
    vim_mode = vim.api.nvim_get_mode().mode,
  }

  local is_cursor_line = context.lnum == context.cursor_line
  local is_current_buffer = context.draw_buffer == context.cursor_buffer
  local is_current_window = context.draw_win_id == context.cursor_win_id

  context.is_cursor_line = is_cursor_line
  context.is_current_buffer = is_current_buffer
  context.is_current_window = is_current_window

  return context
end


---Creates the statuscolumn: diagnostic sign > line number > border that doubles as a git indicator.
---e.g.  24 ▌
---
---This function will be called once per line. Be mindful of performance costs.
---This needs to be a global function for the statuscolumn to be able to call it.
---@return string
function Generate_statuscolumn()
  local context = get_context()

  if is_excluded_filetype(context) then
    return ""
  end

  -- :help statuscolumn
  -- :help statusline
  local components = {
    diagnostics_col.generate(context),
    -- Switch alignment. i.e. Segments above are aligned to the left. Segments below are aligned to the right.
    "%=",
    line_number_col.generate(context),
    -- Just some spacing before the border.
    " ",
    gitsign_col.generate(context),
  }

  return table.concat(components)
end

vim.opt.statuscolumn = "%!v:lua.Generate_statuscolumn()"

