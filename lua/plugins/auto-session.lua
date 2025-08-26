-- https://github.com/rmagatti/auto-session

return {
    'rmagatti/auto-session',
    enabled = false,
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = {
            '~/Downloads',
        },
        -- log_level = 'debug',
    }
}

