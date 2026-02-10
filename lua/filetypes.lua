vim.filetype.add({
    -- Use regular expressions.
    pattern = {
        -- Map the *Jenkinsfile* files to the 'groovy' filetype.
        [".*Jenkinsfile.*"] = "groovy",

        -- Give the proper file type to git configuration files.
        [".*git/config"] = "gitconfig",

        -- Give the proper file type to various yaml configuration files.
        -- This depends on the LSP config: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ansiblels
        [".*ya?ml"] = function (path, _)
            -- Check the name of the file.
            local yaml_patterns = { "gitlab" }
            for _, pattern in pairs(yaml_patterns) do
                print(pattern)
                if string.match(vim.fs.basename(path), pattern) then
                    return "yaml"
                end
            end

            -- Check the repository for Helm configuration files.
            local helm_patterns = { "Chart.yaml", "Chart.lock.yaml" }
            local helm_cfg = vim.fs.find(helm_patterns, { upward = true, type = "file", path = path })
            if vim.tbl_count(helm_cfg) > 0 then
                return 'helm'
            end

            -- Check the repository for Ansible configuration files.
            local ansible_patterns = { "ansible.cfg", "inventory.ini", "inventory.yaml", "inventory.yml" }
            local ansible_cfg = vim.fs.find(ansible_patterns, { upward = true, type = "file", path = path })
            if vim.tbl_count(ansible_cfg) > 0 then
                return 'yaml.ansible'
            end

            return 'yaml'
        end
    },
    filename = {
        ["condarc"] = "yaml",
    },
})

