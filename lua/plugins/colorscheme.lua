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

            NavicIconsArray         = { link = "@type" },
            NavicIconsBoolean       = { link = "@lsp.type.boolean" },
            NavicIconsClass         = { link = "@lsp.type.class" },
            NavicIconsConstant      = { link = "@constant" },
            NavicIconsConstructor   = { link = "@constructor" },
            NavicIconsEnum          = { link = "@lsp.type.enum" },
            NavicIconsEnumMember    = { link = "@lsp.type.enumMember" },
            NavicIconsEvent         = { link = "@lsp.type.event" },
            NavicIconsField         = { link = "@field" },
            NavicIconsFile          = { link = "@field" },
            NavicIconsFunction      = { link = "@lsp.type.function" },
            NavicIconsInterface     = { link = "@lsp.type.interface" },
            NavicIconsKey           = { link = "@field" },
            NavicIconsMethod        = { link = "@lsp.type.method" },
            NavicIconsModule        = { link = "@module" },
            NavicIconsNamespace     = { link = "@lsp.type.namespace" },
            NavicIconsNull          = { link = "@type" },
            NavicIconsNumber        = { link = "@lsp.type.number" },
            NavicIconsObject        = { link = "@lsp.type.struct" },
            NavicIconsOperator      = { link = "@lsp.type.operator" },
            NavicIconsPackage       = { link = "@module" },
            NavicIconsProperty      = { link = "@lsp.type.property" },
            NavicIconsString        = { link = "@lsp.type.string" },
            NavicIconsStruct        = { link = "@lsp.type.struct" },
            NavicIconsTypeParameter = { link = "@lsp.type.typeParameter" },
            NavicIconsVariable      = { link = "@lsp.type.variable" },

            NavicText               = { default = true, bg = "#000000", fg = "#ffffff" },
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

