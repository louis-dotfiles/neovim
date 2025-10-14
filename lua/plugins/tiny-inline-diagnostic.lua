-- https://github.com/rachartier/tiny-inline-diagnostic.nvim

return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
        preset = "classic",
        options = {
            multilines = {
                -- Show errors for all problematic lines as virtual text on the
                -- same line (expands when your cursor is on the same line).
                enabled = true,

                -- Always show all messages while the popup is open. Otherwise
                -- it hides other error messages.
                always_show = true,
            },
        },
    },
    config = function(_ ,opts)
        require('tiny-inline-diagnostic').setup(opts)
        vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
    end,
}

