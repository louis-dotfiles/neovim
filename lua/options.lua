-- :help option-list

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

vim.opt.foldmethod = "indent"

vim.opt.list = true
vim.opt.listchars = {
  tab = " 󰌒",
  trail = "·",
  eol = "↵",
  extends = "󰶻",
  precedes = "󰶺",
}

-- One statusline for all windows.
vim.opt.laststatus = 3

vim.opt.showmode = false


vim.o.shortmess = "ltToOCFsS"


-- global-local options.
vim.go.scrolloff = 6
vim.go.sidescrolloff = 10

