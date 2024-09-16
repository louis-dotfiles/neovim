-- https://github.com/folke/trouble.nvim

local last_outlined_buffer = 0

-- Opens the outline if it's closed.
-- Closes the outline if it's already open for the current buffer.
-- Refreshes the outline to the current buffer otherwise.
local function dynamic_symbols_toggle()
  local trouble = require("trouble")
  local mode = "symbols"

  local is_open = trouble.is_open(mode)
  local current_buffer = vim.api.nvim_win_get_buf(0)

  local function open_symbols()
    last_outlined_buffer = current_buffer
    trouble.open({
      mode = mode,
      pinned = true,
      focus = false,
    })
  end

  if is_open then
    if last_outlined_buffer == current_buffer then
      trouble.close(mode)
    else
      trouble.close(mode)
      open_symbols()
    end
  else
    open_symbols()
  end
end

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    warn_no_results = false,
    open_no_results = true,
  },
  keys = {
    {
      "<Leader>dd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Document diagnostics",
    },
    {
      "<Leader>dw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workspace diagnostics",
    },
    {
      "<Leader>dc",
      "<cmd>Trouble diagnostics close<cr>",
      desc = "Close diagnostics",
    },
    {
      "<Leader>oo",
      dynamic_symbols_toggle,
      desc = "Open",
    },
    {
      "<Leader>oc",
      "<cmd>Trouble symbols close<cr>",
      desc = "Close",
    },
    {
      "<Leader>ot",
      "<cmd>Trouble symbols toggle pinned=true focus=false new=true<cr>",
      desc = "toggle test",
    },
  },
}
