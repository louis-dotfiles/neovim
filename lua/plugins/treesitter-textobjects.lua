-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "master",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    main = "nvim-treesitter.configs",
    opts = {
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- "A" for "argument" (parameter).
                    ["aa"] = {
                        query = "@parameter.outer",
                        desc = "Select outer part of a parameter.",
                    },
                    ["ia"] = {
                        query = "@parameter.inner",
                        desc = "Select outer part of a parameter.",
                    },

                    ["af"] = {
                        query = "@function.outer",
                        desc = "Select outer part of a function.",
                    },
                    ["if"] = {
                        query = "@function.inner",
                        desc = "Select inner part of a function.",
                    },

                    ["ac"] = {
                        query = "@class.outer",
                        desc = "Select outer part of a class.",
                    },
                    ["ic"] = {
                        query = "@class.inner",
                        desc = "Select inner part of a class.",
                    },

                    -- You can also use captures from other query groups like `locals.scm`
                    ["as"] = {
                        query = "@local.scope",
                        query_group = "locals",
                        desc = "Select language scope",
                    },
                },

                selection_modes = {
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = 'V',
                },

                include_surrounding_whitespace = false,
            },
        },
    },
}

