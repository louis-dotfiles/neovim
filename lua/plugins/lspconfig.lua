-- https://github.com/neovim/nvim-lspconfig

-- LspConfig documentation for setting up each leanguage server.
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
--
-- Mason-lspconfig documentation about the correspondance between Mason language server names
-- and lspconfig language server names.
-- https://github.com/mason-org/mason-lspconfig.nvim/blob/v1.x/doc/mason-lspconfig-mapping.txt

local function make_config()
    local data_home = os.getenv("XDG_DATA_HOME") or "~/.local/share"
    local nvim_data_home = data_home .. "/nvim"
    local language_servers_home = nvim_data_home .. "/mason/packages"

    local lsp_config = require('lspconfig')
    require("lspconfig.ui.windows").default_options.border = "single"

    -- https://cmp.saghen.dev/installation.html#merging-lsp-capabilities
    local get_lsp_capabilities = require('blink.cmp').get_lsp_capabilities


    -- LspConfig | Mason
    -- jsonls    | json-lsp
    local jsonls_config = require("plugins/lsp_configs/jsonls")
    lsp_config.jsonls.setup(get_lsp_capabilities(jsonls_config))

    -- LspConfig | Mason
    -- yamlls    | yaml-language-server
    local yamlls_config = require("plugins/lsp_configs/yamlls")
    lsp_config.yamlls.setup(get_lsp_capabilities(yamlls_config))

    -- LspConfig | Mason
    -- gopls     | gopls
    -- lsp_config.gopls.setup(default_config)

    -- LspConfig | Mason
    -- marksman  | marksman
    lsp_config.marksman.setup(get_lsp_capabilities())

    -- LspConfig | Mason
    -- ansiblels | ansible-language-server
    local ansiblels_config = require("plugins/lsp_configs/ansiblels")
    lsp_config.ansiblels.setup(get_lsp_capabilities(ansiblels_config))

    -- LspConfig | Mason
    -- luals     | lua-language-server
    local luals_config = require("plugins/lsp_configs/luals")
    lsp_config.lua_ls.setup(get_lsp_capabilities(luals_config))

    -- LspConfig | Mason
    -- ts_ls     | typescript-language-server
    lsp_config.ts_ls.setup(get_lsp_capabilities({}))

    -- LspConfig | Mason
    -- dockerls  | dockerfile-language-server
    lsp_config.dockerls.setup(get_lsp_capabilities({}))

    -- LspConfig | Mason
    -- bashls    | bash-language-server
    lsp_config.bashls.setup(get_lsp_capabilities({
        filetypes = { "bash", "sh", "zsh" }
    }))

    -- LspConfig   | Mason
    -- terraformls | terraform-ls
    lsp_config.terraformls.setup(get_lsp_capabilities({}))

    -- LspConfig | Mason
    -- groovyls  | groovy-language-server
    lsp_config.groovyls.setup(get_lsp_capabilities({
        -- The LSP needs a little help to find the groovy-language-server executable.
        cmd = { "bash", language_servers_home .. "/groovy-language-server/groovy-language-server" },
    }))

    -- LspConfig | Mason
    -- sqlls     | sqlls
    lsp_config.sqlls.setup(get_lsp_capabilities({}))

    -- LspConfig    | Mason
    -- basedpyright | basedpyright
    lsp_config.basedpyright.setup(get_lsp_capabilities({}))

    lsp_config.helm_ls.setup(get_lsp_capabilities({}))
end


return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- For the completion engine.
        'saghen/blink.cmp',

        -- For LSP servers.
        "williamboman/mason.nvim",
        {
            "williamboman/mason-lspconfig.nvim",
            opts = { automatic_installation = true },
            version = "^1.0.0",
        },

        -- For JSON / YAML schema completion.
        'b0o/schemastore.nvim',
    },
    config = make_config,
}

