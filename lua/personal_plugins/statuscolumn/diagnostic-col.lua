local extmarks = require("personal_plugins.statuscolumn.extmarks")
local utils = require("personal_plugins.statuscolumn.utils")


local M = {}
local cache = utils.Cache:new()
local fresh_signs_available = false


---Given a list of Diagnostic symbols, returns the symbol with the highest severity.
---@param sign_details vim.api.keyset.extmark_details[]
---@return string
local function get_diagnostic_symbol_for_sign_details(sign_details)
  if not sign_details then return " " end

  -- Note: this has nothing to do with the `priority` field on signs.
  local priorities = {
    DiagnosticSignError = 4,
    DiagnosticSignWarn = 3,
    DiagnosticSignHint = 2,
    DiagnosticSignInfo = 1,
  }

  local highest_priority = 0
  local most_severe_sign_details = sign_details[1]

  for _, details in pairs(sign_details) do
    local hl_group = details.sign_hl_group
    local priority = priorities[hl_group]

    if priority and priority > highest_priority then
      highest_priority = priority
      most_severe_sign_details = details
    end
  end

  -- Strip the trailing space.
  local text = most_severe_sign_details.sign_text:gsub("%s+", "")

  return utils.highlight_text(most_severe_sign_details.sign_hl_group, text)
end


-- local calls = 0

---comment
---@param context Context
---@return table<number, vim.api.keyset.extmark_details[]>
local function get_cached_signs(context)
  local sign_details = cache:get_signs(context)
  if not sign_details then
    -- calls = calls + 1
    -- print("total ext calls", calls)
    sign_details = extmarks.get_diagnostic_sign_details()
    cache:set_signs(context, sign_details)
    fresh_signs_available = false
  end

  return sign_details
end


---Generate the diagnostic part of a status column.
---@param context Context
---@return string
function M.generate(context)
  -- No signs in insert mode.
  if context.vim_mode == 'i' then return ' ' end

  local symbol = nil
  if not fresh_signs_available then
    symbol = cache:get_symbol(context)
  end

  if not symbol then
    local sign_details = get_cached_signs(context)

    local line_diagnostic_signs = sign_details[context.lnum]
    symbol = get_diagnostic_symbol_for_sign_details(line_diagnostic_signs)
    cache:set_symbol(context, symbol)
  end

  return symbol
end

-- local count = 0

-- This is part of the caching mechanism.
-- If you simply cache based on `changedtcik`, the statuscolumn is drawn before the diagnostics have time to update. Thus you will not have the correct signs.
-- Luckily an event is triggered when the diagnostics update. And when they do, we clear the cache.
-- A redraw call apparently isn't needed. I suppose it's already queued when we get the event.
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(args)
    -- print("args", vim.inspect(args))
    -- The event is also triggered for every new character typed in insert mode.
    -- We do not care about updating the signs every time we type something.
    local mode_response = vim.api.nvim_get_mode()
    if mode_response.mode == 'i' then return end

    cache:clear_buffer(args.buf)
    fresh_signs_available = true
  end,
})


vim.api.nvim_create_autocmd('BufDelete', {
  callback = function(args)
    -- print("bufdelete", vim.inspect(args))
    cache:forget_buffer(args.buf)
  end,
})


return M

