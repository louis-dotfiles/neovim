-- https://github.com/Bekaboo/dropbar.nvim

local function show_bar(buf, win, _)
  if
    not vim.api.nvim_buf_is_valid(buf)
    or not vim.api.nvim_win_is_valid(win)
    or vim.fn.win_gettype(win) ~= ''
    or vim.wo[win].winbar ~= ''
    -- or vim.bo[buf].ft == 'help'
  then
    return false
  end

  local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
  if stat and stat.size > 1024 * 1024 then
    return false
  end

  return true

  -- Only show the bar when it's a markdown file, a file with treesitter
  -- support, or a Language Server is attached.
  -- return vim.bo[buf].ft == 'markdown'
  --   or pcall(vim.treesitter.get_parser, buf)
  --   or not vim.tbl_isempty(vim.lsp.get_clients({
  --     bufnr = buf,
  --     method = 'textDocument/documentSymbol',
  --   }))
end


local function get_sources(buf, _)
  local sources = require('dropbar.sources')
  local utils = require('dropbar.utils')

  if vim.bo[buf].ft == 'markdown' then
    return {
      sources.path,
      sources.markdown,
    }
  end

  if vim.bo[buf].buftype == 'terminal' then
    return {
      sources.terminal,
    }
  end

  return {
    sources.path,
    utils.source.fallback({
      sources.lsp,
      sources.treesitter,
    }),
  }
end


local function get_path_source_relative_config(buf, win)
  -- Workaround for Vim:E5002: Cannot find window number
  local ok, cwd = pcall(vim.fn.getcwd, win)

  -- Only show the filename for help files.
  if vim.bo[buf].ft == 'help' then
    local filename = vim.api.nvim_buf_get_name(buf)
    local dirname = filename:match("(.*[/\\])")
    return dirname
  end

  return ok and cwd or vim.fn.getcwd()
end

return {
  "Bekaboo/dropbar.nvim",
  opts = {
    bar = {
      enable = show_bar,
      sources = get_sources,
      hover = false,
      pick = {
        pivots = '123456',
      },
    },
    sources = {
      path = {
        relative_to = get_path_source_relative_config,
      },
    },
    menu = {
      hover = false,
      win_configs = {
        border = "rounded",
      },
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "<Leader>;",
      function() require('dropbar.api').pick() end,
      desc = "Pick symbols in winbar",
    },
    {
      "[;",
      function() require('dropbar.api').goto_context_start() end,
      desc = "Go to start of current context",
    },
    {
      "];",
      function() require('dropbar.api').select_next_context() end,
      desc = "Select next context",
    },
  },
}

