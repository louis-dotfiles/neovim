-- https://github.com/rcarriga/nvim-notify

local function make_config(_, opts)
    local notify = require("notify")
    notify.setup(opts)

    vim.notify = notify
end

return {
    "rcarriga/nvim-notify",
    opts = {
        -- The timeout feels longer than that. But it is working.
        timeout = 2000,
    },
    config = make_config,
}

