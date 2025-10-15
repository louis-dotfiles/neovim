-- https://github.com/folke/flash.nvim

return {
  "folke/flash.nvim",
  event = "VeryLazy",

  ---@type Flash.Config
  opts = {},
  keys = {
    {
        "<Leader><Leader>",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
    },
  },
}

