# Neovim configuration

This is my Neovim configuration written in Lua to get an "IDE-like"
experience without too many bells and whistles.

## Features

Language server protocol (LSP): get errors and warning while you code, not when you compile or run your code.

Editing support functions:
- Add/remove/change surrounding "pairs" like `{}`, `()`, `''` ...
- Alignment / tabulation.
- Split / join lists (e.g. import statements).
- Comment code.
- LSP related:
  - Rename functions and variables.
  - Go to refererences.
  - Go to definition.
  - Code completion and snippets.
- Color codes preview.

Easily find files, by name or content with `:Telescope`. And much more!

Pay a visit to the [User_manual.md](./User_manual.md) documentation to learn more.

## Installation prerequisites

**Neovim version >= 0.7.0**.

Neovim itself doesn't need any additional programs to be installed
and work, but to enjoy the full potential of the additional
plugins (particularly LSP), you will need the following:
- [Git](https://git-scm.com/).
- [Node.js](https://nodejs.org/en).
- [Cargo](https://github.com/rust-lang/cargo) (the Rust package manager).
- Some sort of C compiler (e.g. gcc).

If you are using NixOs like I do, then also install:
- `pkgs.lua-language-server`
- `pkgs.marksman`

e.g. All together in a `.nix` configuration:
```nix
  packages = with pkgs; [
    neovim

    # Runtimes and package managers.
    nodejs_20
    cargo

    # Compilers.
    gccgo # C compiler.

    # Languages servers.
    lua-language-server
    marksman # Markdown.
  ];
```

## Installation

All you have to do is clone this repository in `~/.config/nvim`,
i.e. [~/.config/nvim/init.lua](~/.config/nvim/init.lua) should be
[this file](./init.lua).

Upon first starting Neovim, the configuration will:
1. download the package manager
1. In turn the package manager will download all configured plugins.
1. Treesitter (one of the plugins) will download the configured language
   highlighting configurations.

Once this is done you should manually install the language servers you need /
want / are configured. See [CONTRIBUTING](./CONTRIBUTING.md##lsp-configuration).

## Is everything ok?

Running `:checkhealth` can give you some insight into what might be
broken / missing. Take some time to review potential errors and
warnings (warning usually aren't critical and most can safely be
ignored).

