-- https://github.com/lukas-reineke/indent-blankline.nvim

local function make_config(_, opts)
    local ibl = require("ibl")

    -- Change the highlight groups because the colorscheme has weak contrast.
    -- Do this before setup().
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#FFCB6B" })

    ibl.setup(opts)
end

return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    main = "ibl",
    opts = {
        indent = {
            char = "▏",
        },
        scope = {
            enabled = true,
        },
    },
    config = make_config,
}
