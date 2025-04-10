-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
--
-- Schema validation support with
-- https://github.com/b0o/SchemaStore.nvim

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local settings = {
    json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
    },
}


return {
    capabilities = capabilities,
    settings = settings,
}

