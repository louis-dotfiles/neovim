-- https://github.com/nvim-telescope/telescope.nvim
-- The goat. If I were to keep only one plugin, that'd be the one.


local function make_config(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require "telescope.actions.state"

    -- This is a custom "delete buffer" function. It should only be used with
    -- the buffers picker.
    local function delete_buffer(prompt_bufnr)
        local current_picker = action_state.get_current_picker(prompt_bufnr)

        if current_picker.prompt_title == "Buffers" then
            actions.delete_buffer(prompt_bufnr)
        end
    end

    opts.defaults.mappings = {
        i = {
            -- Unmap the default <C-u> telescope mapping so that I can clear the prompt.
            ["<C-u>"] = false,
            ["<C-h>"] = actions.select_horizontal,

            ["<C-d>"] = delete_buffer,

            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-f>"] = actions.preview_scrolling_down,
        },
    }

    -- Load extensions here.

    telescope.setup(opts)
end



return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
    },
    opts = {
        defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top",
            },
            prompt_prefix = '  ',
            selection_caret = ' ',
            multi_icon = ' ',
            preview = {
                -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ignore-files-bigger-than-a-threshold
                filesize_limit = 0.1, -- MB
            },
        },
    },
    config = make_config,
    keys = {
        {
            "<Leader>ff",
            "<cmd>Telescope find_files<cr>",
            desc = "Files",
        },
        {
            "<Leader>fa",
            "<cmd>Telescope resume<cr>",
            desc = "Find again (resume)",
        },
        {
            "<Leader>fg",
            "<cmd>Telescope live_grep<cr>",
            desc = "Grep",
        },
        { -- This one is useful when you don't recall the name of the files you opened.
            "<Leader>fb",
            "<cmd>Telescope buffers<cr>",
            desc = "Buffers",
        },
        {
            "<Leader>fk",
            "<cmd>Telescope keymaps<cr>",
            desc = "Keymaps",
        },
        {
            "<Leader>fh",
            "<cmd>Telescope help_tags<cr>",
            desc = "Help",
        },
        {
            "<Leader>fc",
            "<cmd>Telescope highlights<cr>",
            desc = "Colors (highlight groups)",
        },
        {
            "<Leader>fr",
            "<cmd>Telescope neoclip<cr>",
            desc = "Registers",
        },
        {
            "<Leader>fn",
            "<cmd>Telescope notify<cr>",
            desc = "Notifications",
        },
        {
            "<Leader>fm",
            "<cmd>Telescope macroscope<cr>",
            desc = "Macros",
        },
        {
            "<Leader>fs",
            "<cmd>Telescope search_history<cr>",
            desc = "Searches",
        },
    },
    cmd = {
        "Telescope",
    },
}
