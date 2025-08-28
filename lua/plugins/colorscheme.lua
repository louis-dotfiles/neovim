-- https://github.com/zootedb0t/citruszest.nvim


return {
    -- "zootedb0t/citruszest.nvim",
    dir = '~/Documents/louis/neonlights',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function (_, opts)
        require("citruszest").setup(opts)

        vim.cmd("colorscheme citruszest")
    end
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

