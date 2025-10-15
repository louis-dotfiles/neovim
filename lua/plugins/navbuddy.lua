-- https://github.com/SmiteshP/nvim-navbuddy

return {
    "hasansujon786/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        lsp = { auto_attach = true },
    },
    keys = {
        {
            "<leader>ln",
            function () require("nvim-navbuddy").open() end,
            desc = "Open nav buddy",
        },
    },
}

