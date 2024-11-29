-- https://github.com/rcarriga/nvim-notify

local function make_config()
  vim.notify = require("notify")
end

return {
  "rcarriga/nvim-notify",
  opts = {},
  config = make_config,
}

-- return {
--   "folke/snacks.nvim",
--   opts = {
--     notifier = {
--       -- your notifier configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   }
-- }
