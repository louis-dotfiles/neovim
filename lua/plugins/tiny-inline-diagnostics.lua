-- https://github.com/rachartier/tiny-inline-diagnostic.nvim

return {
    "rachartier/tiny-inline-diagnostic.nvim",
    priority = 1000, -- needs to be loaded in first.
    event = "VeryLazy", -- Or `LspAttach`.
    enabled = false,
    config = function()
        require('tiny-inline-diagnostic').setup()
    end
}
