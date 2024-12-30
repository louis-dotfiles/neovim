-- https://github.com/louis-neovim-plugins/switchboard

return {
    "louis-neovim-plugins/switchboard",
    opts = {
        switches = {
            {
                label = "Inlay hints",
                is_on = function ()
                    return vim.lsp.inlay_hint.is_enabled()
                end,
                keymap = {
                    "h",
                    function ()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end,
                },
            },
            {
                label = "Diagnostics",
                is_on = function ()
                    return vim.diagnostic.is_enabled()
                end,
                keymap = {
                    "d",
                    function ()
                        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                    end,
                },
            },
            {
                label = "Relative line numbers",
                is_on = function ()
                    return vim.o.relativenumber
                end,
                keymap = {
                    "n",
                    function ()
                        vim.o.relativenumber = not vim.o.relativenumber
                    end,
                },
            },
            {
                label = "Line wrap",
                is_on = function ()
                    return vim.wo.wrap
                end,
                keymap = {
                    "w",
                    function ()
                        vim.wo.wrap = not vim.wo.wrap
                    end,
                },
            },
            {
                label = "Color preview",
                is_on = function ()
                    return require("nvim-highlight-colors").is_active()
                end,
                keymap = {
                    "c",
                    function ()
                        require("nvim-highlight-colors").toggle()
                    end,
                },
            },
        },
    },
    keys = {
        {
            "<leader>s",
            "<cmd>Switchboard<CR>",
            desc = "Switchboard",
        },
    },
}

