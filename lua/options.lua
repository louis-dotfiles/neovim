-- :help option-list

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.clipboard = "unnamedplus"

--Set indentation size to 4 for readability and to force me to write more
--concise code.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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
vim.o.showcmd = false

vim.wo.colorcolumn = "80,100,120"



-- global-local options.
vim.go.scrolloff = 6
vim.go.sidescrolloff = 10

