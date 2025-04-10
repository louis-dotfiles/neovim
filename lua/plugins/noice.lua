-- https://github.com/folke/noice.nvim

return {
    enabled = false, -- Too invasive for my taste.
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            enabled = false,
            view = "cmdline",
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true,
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            -- lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    }
}
