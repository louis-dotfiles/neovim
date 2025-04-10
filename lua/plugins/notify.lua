-- https://github.com/rcarriga/nvim-notify

local function make_config()
    vim.notify = require("notify")
end

return {
    "rcarriga/nvim-notify",
    opts = {},
    config = make_config,
}

