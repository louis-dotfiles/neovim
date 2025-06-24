vim.filetype.add({
    -- Use regular expressions.
    pattern = {
        -- Map the *Jenkinsfile* files to the 'groovy' filetype.
        [".*Jenkinsfile.*"] = "groovy",

        -- Give the proper file type to git configuration files.
        [".*git/config"] = "gitconfig",

        -- Give the proper file type to ansible yaml configuration files.
        -- This depends on the LSP config: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ansiblels
        [".*ya?ml"] = function (_, _)
            local ansible_patterns = { "ansible.cfg", "inventory.ini", "inventory.yaml", "inventory.yml" }
            local ansible_cfg = vim.fs.find(ansible_patterns, { upward = true })
            -- print(vim.inspect(ansible_cfg))

            return vim.tbl_isempty(ansible_cfg) and 'yaml' or 'yaml.ansible'
        end
    },
    filename = {
        ["condarc"] = "yaml",
    },
})

