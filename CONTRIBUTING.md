# Contributing to this configuration

This documentation will provide more technical information on how things work,
are supposed to work, actually work, and so on ...  
It is intendend for people that will work on modifying the configuration code
(yay future me).

We will assume you are already familiar with the contents of the README and the
User_manual.



## General guidelines

This is a Lua house, please use vimscript as a last resort.

I like "atomic" configurations where each plugin has its own file / directory. Please keep it that way.

The [Lazy package manager](https://github.com/folke/lazy.nvim) is at the heart of the configuration and dictates some
of the file organization. **You have to familiarize yourself with its
documentation**.

Add a link to each plugin's documentation at the top of each configuration file.
Add a link to the relevant documentation whenever you use "third party code".

Exceptions to all of the above rules are acceptable as long as they remain exceptions.



## Plugins

Here's the complete list of plugins and what we use them for:
- align: tabulate text.
- barbecue: file and LSP information at the top of every buffer.
- cmp-buffer: completes buffer names.
- cmp-cmdline: completes command names.
- cmp-nvim-lsp: lsp completion for code.
- cmp-path: completes paths.
- comment.nvim: comment code.
- dressing: nices prompt popups.
- guess-indent.nvim: automatically sets the indentation level based on the current file indentation pattern.
- gx.nvim: replacement `gx` to open links in your browser.
- harpoon-lualine: harpoon indicators in the statusline.
- harpoon: "bookmark" files and easily switch to them.
- indent-blankline.nvim: indentation guides for code scopes.
- lazy.nvim: the plugins manager.
- lualine.nvim: status line at the bottom of the screen.
- luasnip: snippets.
- markview: preview markdown files.
- mason-lspconfig.nvim: adapter between Mason and lspconfig.
- mason.nvim: installer for language servers.
- material.nvim: colorscheme.
- mini.align: easily align / tabulate code.
- nvim-cmp: provide a completion window.
- nvim-highlight-colors: Creates color previews from color codes.
- nvim-lspconfig: configure LSP servers.
- nvim-surround: change surrounding "pairs".
- nvim-tree: replacement file explorer.
- nvim-treesitter: syntax highlighting for various languages.
- nvim-web-devicons: nice icons.
- schemastore.nvim: provides schemas for JSON and YAML completion.
- telescope.nvim: fuzzy finder.
- treesj: split and join lines in a list.
- trouble.nvim: nice diagnostic summary window and code outline.
- which-key.nvim: reminder tool for keymaps.



## LSP configuration

This is arguably the most tricky part of the configuration so here's how it works:

### Language server installation

`:Mason` allows you to install language servers.

Each language server is its own project maintained by different people with
different technologies and requirements. Some can be installed by `npm`,
other by `cargo`, others form source ... You should have a look at their
respective Github page to see which is more up-to-date / accurate and so on.

### Naming differences between Mason and lspconfig

Once installed, the language servers need to be configured by `lspconfig` (see below), but it uses different names.

You can find a correspondance table [here](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md).

e.g. If you installed `json-lsp` with Mason, it will be known to lspconfig as `jsonls`.

### Langage server configuration

`lspconfg` is a collection of language server configurations which you can use to rapidly configure language servers.

You can find the recommended configuration code for each language server [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

You can find our current configurations in [./lua/plugins/lspconfig.lua](./lua/plugins/lspconfig.lua).

### Capabilities

What are capabilities? It's basically a way for language server to indicate to clients what they can do.

Language servers do not all have the same features, you can think of capabilities as a "feature list". I think.



## Debugging tips and tricks

### General Lua debugging

You can use `print(vim.inspect(your_lua_var))` to debug your lua scripts.
The message should be visible in `:messages`.

### 'Lazy' plugins configuration

If you do not plan on specifying custom options for a plugin, you still need to define `opts` like so:
```lua
return {
  "plugin_name",
  opts = {},
}
```

Otherwise the plugin simply won't be started.

### Debugging LSP issues

Use `:LspLog` to get more information about potentially crashed language servers.

This is very handy for weird Linux distributions like NixOs: I had tried to
install `lua-language-server` with Mason, but it tried to dynamically link the
language server executable and this is a big no no in NixOs, causing crashes.
Thus I had to install the language server with the NixOs package manager directly instead.

### Debugging highlight groups

Use `:Telescope highlights` to easily browse highlights (or the `<leader>fc` keymap).

To overwrite the colors, put them in the
[colorscheme.lua](./lua/plugins/colorscheme.lua) file. Colorscheme may load
asynchronously and override what you define elsewhere, so you need to make sure
it will play nicely with your colorscheme of choice.

### Why is feature X not working anymore?

I was wondering why my `gx` keybinding did not work anymore. Turns out it was a
feature of the builtin `Netrw` file explorer and I had disabled it.

Simply be wary that some seamingly unrelated features may come from the same plugin.



## TODOs

- [x] LSP server status in statusline.
- [x] Lua LSP setup (currently broken).
- [x] LSP GoTos and refactoring.
- [~] Understand the nuances between the various references / incoming_calls, implementation / definition
- [x] current indentation scope highlight not working. > Theme was to blame.
- [x] hex color codes highlighting
- [ ] image preview tool
- [x] tabulation tool
- [x] surround tool
- [x] border for lazy UI
- [x] folding
- [x] diagnostic icons
- [x] borders for various LSP popups.
- [x] fix file explorer 'h' mapping
- [x] lualine theme
- [x] keybinding for clearing all harpoons
- [x] code outline
- [x] wider outline window
- [x] fix the markdown preview trigger
- [ ] statuscolumn: `signs > number > gitsign+border`
- maybe?
  - [ ] 'noice' for nicer UI and hide the command line? No. Too invasive for me.
  - [ ] more text objects?
  - [ ] leap?
  - [x] nvim-notify
  - [ ] use telescope for quickfix list?
  - [ ] Telescope actions? (some broken stuff for now).

