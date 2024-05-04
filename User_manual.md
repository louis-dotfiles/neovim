# User Manual

Some "getting" started tips and advice whil using this configuration.
There are no earthshattering changes that will significantly alter your
regular usage of Neovim. The new features are discrete and mostly "opt
in".

## General "discovery" advice

You can have a look at the [keybindings overview](##keybindings-overview) below to get a taste of what new keybindings are available.

Spending some time to read the `which-key` hints when you start typing keybindings should also help you learn the keybindings faster.

The keybinds should all have some semantic meaning, so leaning them should not be too hard. e.g. `<Leader>ff` to "Find Files".

If you want to find a mapping based on some keyword you can also use `:Telescope keymaps` or `<Leader>fk` to "Find Keymaps" (starting to get the idea yet?).


In the end, you will have to learn by actually using the configuration. Such is the essence of Vim me thinks.

Being a Neovim user means you will tinker with the configuration sooner rather
than later. Once you feel like doing so, pay a visit to the [CONTRIBUTING.md
documentation](./CONTRIBUTING.md) to learn more about the configuration.

## Keybindings overview

Window navigation has been simplified to use `<C-hjkl>`, saving some precious keystrokes.

You can find more in the [./lua/keymaps.lua](./lua/keymaps.lua) file.
Most new features will be available as keybindings:
- `<leader>`, which is usually the `<Space>` key, will have most "heavy" features like:
  - `f` finding stuff.
    - `f`: files.
    - `g`: file contents, aka Greping.
    - `k`: keymaps.
    - `h`: help files.
  - `l` LSP operations (jumping to definitions, renaming, findng references ...).
  - `p` plugins management.
  - `h` harpoons management.
  - `d` LSP diagnostics.
- `g` has a few additional "editing" mappings:
  - `x`: behaves much like the orignal keybinding. It will open links, even partial ones like `user/project` github references.
  - `a`: aligns / tabuates lines.
  - `s`: splits / joins lists.
  - `c`: comment code.

