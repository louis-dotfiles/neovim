-- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#lazynvim

return {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    build = ":MasonUpdate",
    keys = {
        { "<Leader>pl", "<cmd>Mason<cr>", desc = "Language servers" },
        { "<Leader>ll", "<cmd>Mason<cr>", desc = "Language servers" },
    },
    cmd = "Mason",
    opts = {
        ui = { border = "rounded", },
    },
}

