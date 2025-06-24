-- https://github.com/neovim/nvim-lspconfig

-- LspConfig documentation for setting up each leanguage server.
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
--
-- Mason-lspconfig documentation about the correspondance between Mason language server names
-- and lspconfig language server names.
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

local tbl_merge = vim.tbl_deep_extend

local function make_config()
    local data_home = os.getenv("XDG_DATA_HOME") or "~/.local/share"
    local nvim_data_home = data_home .. "/nvim"
    local language_servers_home = nvim_data_home .. "/mason/packages"

    local lsp_config = require("lspconfig")
    require("lspconfig.ui.windows").default_options.border = "single"

    -- https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#recommended-configuration
    local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local default_config = { capabilities = cmp_capabilities }



    -- LspConfig | Mason
    -- jsonls    | json-lsp
    local jsonls_config = require("plugins/lsp_configs/jsonls")
    lsp_config.jsonls.setup(tbl_merge("force", default_config, jsonls_config))

    -- LspConfig | Mason
    -- yamlls    | yaml-language-server
    local yamlls_config = require("plugins/lsp_configs/yamlls")
    lsp_config.yamlls.setup(tbl_merge("force", default_config, yamlls_config))

    -- LspConfig | Mason
    -- gopls     | gopls
    lsp_config.gopls.setup(default_config)

    -- LspConfig | Mason
    -- marksman  | marksman
    lsp_config.marksman.setup(default_config)

    -- LspConfig | Mason
    -- ansiblels | ansible-language-server
    local ansiblels_config = require("plugins/lsp_configs/ansiblels")
    lsp_config.ansiblels.setup(tbl_merge("force", default_config, ansiblels_config))

    -- LspConfig | Mason
    -- luals     | lua-language-server
    local luals_config = require("plugins/lsp_configs/luals")
    lsp_config.lua_ls.setup(tbl_merge("force", default_config, luals_config))

    -- LspConfig | Mason
    -- ts_ls     | typescript-language-server
    lsp_config.ts_ls.setup(default_config)

    -- LspConfig | Mason
    -- dockerls  | dockerfile-language-server
    lsp_config.dockerls.setup(default_config)

    -- LspConfig | Mason
    -- bashls    | bash-language-server
    lsp_config.bashls.setup(default_config)

    -- LspConfig   | Mason
    -- terraformls | terraform-ls
    lsp_config.terraformls.setup(default_config)

    -- LspConfig | Mason
    -- groovyls  | groovy-language-server
    lsp_config.groovyls.setup(tbl_merge("force", default_config, {
        -- The LSP needs a little help to find the groovy-language-server executable.
        cmd = { "bash", language_servers_home .. "/groovy-language-server/groovy-language-server" },
    }))

    -- LspConfig | Mason
    -- sqlls     | sqlls
    lsp_config.sqlls.setup(default_config)

    -- LspConfig    | Mason
    -- basedpyright | basedpyright
    lsp_config.basedpyright.setup(default_config)
end

return {
    "neovim/nvim-lspconfig",
    -- event = "LazyFile",

    -- Load these plugins first.
    -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#setup
    dependencies = {
        "williamboman/mason.nvim",
        { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },

        -- For configuration file schemas.
        "b0o/schemastore.nvim",

        -- For capabilities.
        "hrsh7th/cmp-nvim-lsp",
    },
    config = make_config,
}

