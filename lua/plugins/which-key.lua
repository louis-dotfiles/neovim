-- https://github.com/folke/which-key.nvim

-- Mappings are usually defined in the individual plugin files, however we still need to give a name
-- to the mappings groups, and define plugin independent mappings.
-- Hence this small configuration script.


-- :help vim.lsp.buf.references()
local function open_qflist_with_trouble(options)
    vim.fn.setqflist({}, ' ', options)
    require("trouble").open("qflist")
end


---@param diagnostic? vim.Diagnostic
local function jump_to_diagnostic(diagnostic)
    if diagnostic then
        vim.diagnostic.jump({ diagnostic = diagnostic })
    end
end


return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        preset = "modern",
        win = {
            border = "single", -- none, single, double, shadow
        },
        icons = {
            mappings = false,
            group = "󰉋 ",
        },
        spec = {
            { "<leader>d", group = "Diagnostics" },
            { "<leader>o", group = "Code outline" },
            { "<leader>m", group = "Markdown" },
            { "<leader>f", group = "Find" },
            { "<leader>h", group = "Harpoon" },


            { "<leader>l", group = "LSP", },
            { "<leader>lh", function() vim.lsp.buf.hover({ border = "rounded" }) end, desc = "Hint" },
            { "<leader>ld", vim.lsp.buf.definition,     desc = "Go to definition" },
            { "<leader>li", vim.lsp.buf.implementation, desc = "Implementation" },
            {
                "<leader>lm", -- 'm' for 'mentions'.
                function()
                    vim.lsp.buf.references(nil, { on_list = open_qflist_with_trouble })
                end,
                desc = "References",
            },
            { "<leader>lc", vim.lsp.buf.incoming_calls, desc = "Calls" },
            { "<leader>lr", vim.lsp.buf.rename,         desc = "Rename" },
            { "<leader>ll", "<cmd>LspInfo<cr>",         desc = "Info" }, -- 'll' because it's quick to type.


            { "<leader>p", group = "Packages" },
            { "<leader>pp", "<cmd>Lazy<cr>", desc = "Plugins" },


            { "<leader>w", "<cmd>write<cr>", desc = "Write file" },
            { "<leader>q", "<cmd>quit<cr>", desc = "Quit file" },


            {
                "[d",
                function() jump_to_diagnostic(vim.diagnostic.get_prev()) end,
                desc = "Previous diagnostic",
            },
            {
                "]d",
                function() jump_to_diagnostic(vim.diagnostic.get_next()) end,
                desc = "Next diagnostic",
            },
        },
    },
}

