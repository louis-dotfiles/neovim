-- :help nvim_set_keymap

local set_keymap = vim.keymap.set
local keymap_opts = {
  noremap = true,
}

-- Alt + hjkl to move around while in insert mode.
set_keymap("i", "<A-h>", "<Left>",  keymap_opts)
set_keymap("i", "<A-j>", "<Down>",  keymap_opts)
set_keymap("i", "<A-k>", "<Up>",    keymap_opts)
set_keymap("i", "<A-l>", "<Right>", keymap_opts)

set_keymap("i", "<A-S-h>", "<S-Left>", keymap_opts)
set_keymap("i", "<A-S-l>", "<S-Right>", keymap_opts)

-- Ctrl + hjkl to change window panes in normal mode.
set_keymap("n", "<C-h>", "<C-w>h", keymap_opts)
set_keymap("n", "<C-j>", "<C-w>j", keymap_opts)
set_keymap("n", "<C-k>", "<C-w>k", keymap_opts)
set_keymap("n", "<C-l>", "<C-w>l", keymap_opts)

-- Shift + hl to go to the beginning and he end of lines in the normal and
-- visual modes.
-- Much easier than ^ and $.
set_keymap({ "n", "v" }, "<S-h>", "^", keymap_opts)
set_keymap({ "n" }, "<S-l>", "$", keymap_opts)
set_keymap({ "v" }, "<S-l>", "$h", keymap_opts)

-- Alt + hl to move around while typing a command.
set_keymap("c", "<A-h>", "<Left>", keymap_opts)
set_keymap("c", "<A-l>", "<Right>", keymap_opts)
set_keymap("c", "<A-S-h>", "<S-Left>", keymap_opts)
set_keymap("c", "<A-S-l>", "<S-Right>", keymap_opts)

-- Alt + jk to browse the command history while typing a command.
set_keymap("c", "<A-j>", "<Down>", keymap_opts)
set_keymap("c", "<A-k>", "<Up>", keymap_opts)

set_keymap("n", "yc", "yygccp", { remap = true })

-- Function keys mappings. They are rarely used for anything so ... "free real estate"?
set_keymap("n", "<F1>", "<cmd>Telescope help_tags<cr>", keymap_opts)


local function clear_search_pattern()
  vim.cmd(':let @/ = ""')
end
set_keymap("n", "<F5>", clear_search_pattern, keymap_opts)

