-- Neovim configuration written in Lua.

-- This needs to be defined very early.
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("plugin_manager")

require("options")
require("config")

require("keymaps")
require("abbreviations")
require("filetypes")

