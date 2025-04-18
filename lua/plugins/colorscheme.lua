-- https://github.com/marko-cerovac/material.nvim

local function make_config(_, opts)
    require("material").setup(opts)

    -- Run this LAST.
    vim.g.material_style = "deep ocean"

    vim.cmd("colorscheme material")
end

return {
    "marko-cerovac/material.nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
        plugins = {
            "harpoon",
            "indent-blankline",
            "neogit",
            "nvim-tree",
            "nvim-web-devicons",
            "telescope",
            "trouble",
            "which-key",
        },
        custom_highlights = {
            -- Brighter visual selection, more visible when selecting individual
            -- characters like surrounding quotes.
            Visual = { bg = "#283569" },

            -- Scrollbar handle in nvim-cmp popups.
            PmenuThumb = { bg = "#FFCB6B" },

            -- Visible borders.
            FloatBorder           = { fg = "#FFCB6B" },
            LspInfoBorder         = { fg = "#FFCB6B" },
            TelescopePromptBorder = { fg = "#FFCB6B" },
            TelescopePromptTitle  = { fg = "#FFCB6B" },
            NvimTreeWinSeparator  = { fg = "#FFCB6B" },
            WinSeparator          = { fg = "#FFCB6B" },
        },
    },
    config = make_config,
}

-- I do not use this colorscheme as my main colorscheme.
-- I use it when I need to debug color issues.
-- e.g. At some point, indent-blankline was not highlighting the active scope. Swithcing to this colorscheme proved that it actually did its job, but my actual colorscheme didn't have different colors set for the active and inactive scope indentation lines.
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd("colorscheme tokyonight")
--   end
-- }

