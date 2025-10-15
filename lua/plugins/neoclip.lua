-- https://github.com/AckslD/nvim-neoclip.lua

return {
    "AckslD/nvim-neoclip.lua",
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
        keys = {
            telescope = {
                i = {
                    select = '<CR>', -- ???
                    paste = false,
                    paste_behind = false,
                    replay = '<C-q>', -- For macros.
                    delete = '<C-d>',
                    edit = '<C-e>',
                    custom = {
                        ['<C-y>'] = function(opts)
                            local handlers = require('neoclip.handlers')
                            handlers.paste(opts.entry, 'p')
                        end,
                    },
                },
            },
        },
    },
}
