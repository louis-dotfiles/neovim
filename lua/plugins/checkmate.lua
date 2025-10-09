-- https://github.com/bngarren/checkmate.nvim
-- It's a TODOs mangement plugin.

return {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    opts = {
        files = { "*.md" },
        keys = false,
        smart_toggle = {
            enabled = true,
            include_cycle = true,
            check_down = "direct_children",
            uncheck_down = "direct_children",
            check_up = "direct_children",
            uncheck_up = "direct_children",
        },
        todo_states = {
            -- we don't need to set the `markdown` field for `unchecked` and `checked` as these can't be overriden
            ---@diagnostic disable-next-line: missing-fields
            todo = {
                marker = "□",
                markdown = " ",      -- Saved as `- [ ]`.
                type = "incomplete", -- Counts as "not done".
            },
            in_progress = {
                marker = "󰦖",
                markdown = "~",      -- Saved as `- [~]`.
                type = "incomplete", -- Counts as "not done".
            },
            cancelled = {
                marker = "✗",
                markdown = "c",    -- Saved as `- [c]` 
                type = "complete", -- Counts as "done".
            },
            on_hold = {
                marker = "⏸",
                markdown = "/",    -- Saved as `- [/]`.
                type = "inactive", -- Ignored in counts.
            },
            done = {
                marker = "✔",
                markdown = "x",    -- Saved as `- [x]`.
                type = "complete", -- Counts as "done".
            },
        },
        use_metadata_keymaps = false,
    },
    keys = {
        {
            "<leader>td",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle("checked")
                checkmate.add_metadata("done")
            end,
            desc = "Done",
        },
        {
            "<leader>tw",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle("in_progress")
                checkmate.add_metadata("started")
                checkmate.remove_metadata("done")
            end,
            desc = "Work In progress",
        },
        {
            "<leader>tc",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle("cancelled")
            end,
            desc = "Cancelled",
        },
        {
            "<leader>th",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle("on_hold")
                checkmate.remove_metadata("done")
            end,
            desc = "On Hold",
        },
        {
            "<leader>tt",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle("todo")
                checkmate.remove_metadata("started")
                checkmate.remove_metadata("done")
            end,
            desc = "Uncheck",
        },

        {
            "<leader>tp1",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle_metadata("priority", "high")
            end,
            desc = "High priority",
        },
        {
            "<leader>tp2",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle_metadata("priority", "medium")
            end,
            desc = "Medium priority",
        },
        {
            "<leader>tp3",
            function()
                local checkmate = require("checkmate")
                checkmate.toggle_metadata("priority", "low")
            end,
            desc = "Low priority",
        },
        {
            "<leader>tpc",
            function()
                local checkmate = require("checkmate")
                checkmate.remove_metadata("priority")
            end,
            desc = "Clear priority",
        },
        {
            "<leader>tpr",
            function()
                local checkmate = require("checkmate")
                checkmate.remove_metadata("priority")
            end,
            desc = "Clear priority",
        },
    },
}
