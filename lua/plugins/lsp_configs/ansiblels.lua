-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ansiblels

return {
    settings = {
        ansible = {
            validation = {
                lint = { enabled = false },
            },
        },
    },
}

