# User Manual

This is a collection of "getting" started tips for this configuration.

There are no earthshattering changes that will significantly compromise a
vanilla user experience. One exception is that `netrw`, the default file
browser, has been replaced with a plugin. So you should use `<Space>e`, or
`:Neotree left` to open the new file explorer now.



## General "discovery" advice

You can have a look at the [keybindings overview](##keybindings-overview) below
to get a taste of what new keybindings are available. Spending some time
reading the `which-key` hints when you start typing keybindings should also
help you learn the keybindings faster. The keybinds should all have some
semantic meaning, so leaning them should not be too hard. e.g. `<Space>ff` to
"Find Files".

If you want to find a mapping based on some keyword you can also use
`:Telescope keymaps` or `<Space>fk` to "Find Keymaps" (starting to get the
idea yet?).


In the end, you will have to learn by actually using the configuration. Such is
the essence of Vim me thinks.

Being a Neovim user means you will tinker with the configuration sooner rather
than later. Once you feel like doing so, pay a visit to the [CONTRIBUTING.md
documentation](./CONTRIBUTING.md) to learn more about the configuration.



## The main features

### Telescope

It will considerably improve your workflow. Allowing you to easily search,
find, and preview just about anything. What I mostly use it for:
- `grep`ing. Aka project-wide word search.
- Finding files.
- Finding buffers.
- Finding `help` pages (incredibly handy).

### Harpoon

You can now bookmark the handful of files you are currently spending time on,
and quickly switch between them. This is much more handy than browsing through
a tabline.

The typical use case is to "harpoon" a handful of files you need to come back
to very frequently.

### LSP support

This is a "passive" feature, that doesn't require any adaptation from you. It
provides completion for the main languages I use, but you can easily add some
more.

Select the options you want with `<C-n>` and `<C-p>`, then keep typing, or hit
`<Esc>` if you are done.  
Snippets need to be "activated" with `<C-y>`.


## Keybindings overview

Window navigation has been simplified to use `<C-hjkl>`, saving some precious keystrokes.

You can find more in the [./lua/keymaps.lua](./lua/keymaps.lua) file.

Most new features will be available as keybindings:
- `<leader>`, which is usually the `<Space>` key, will have most "heavy" features like:
  - `d`: LSP diagnostics.
  - `f`: finding stuff with Telescope.
    - `b`: open buffers, handy to get back to this file you can't remember the name of.
    - `c`: highlight groups (colors).
    - `f`: files.
    - `g`: file contents, aka `grep`ing.
    - `h`: help files.
    - `k`: keymaps.
  - `h`: harpoons management.
  - `l`: LSP operations (jumping to definitions, renaming, findng references ...).
  - `m`: markdown preview stuff.
  - `o`: code outline (LSP symbols).
  - `p`: plugins management.
  - `s`: switchboard interface.
- `g` has a few additional "editing" mappings:
  - `a`: aligns / tabulates lines.
  - `c`: comment code.
  - `s`: splits / joins lists.
  - `x`: behaves much like the orignal keybinding. It will open links, even partial ones like `user/project` github references.

