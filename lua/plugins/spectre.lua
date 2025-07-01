-- https://github.com/nvim-pack/nvim-spectre

return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "BurntSushi/ripgrep",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    keys = {
        {
            "<Leader>/",
            "<cmd>lua require('spectre').toggle()<CR>",
            desc = "Toogle Spectre",
        },
    },
}
