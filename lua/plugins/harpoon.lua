-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
  "ThePrimeagen/harpoon",
  dependencies = {"nvim-lua/plenary.nvim" },
  branch = "harpoon2",
  opts = {
    settings = {
      save_on_toggle = true,
      save_on_ui_close = true,
    },
  },
  keys = {
    {
      "<Leader>a",
      function() require("harpoon"):list():add() end,
      desc = "Add to harpoon",
    },
    {
      "<Leader>hl",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon list",
    },
    {
      "<Leader>hc",
      function() require("harpoon"):list():clear() end,
      desc = "Clear harpoons",
    },

    {
      "<Leader>h1",
      function() require("harpoon"):list():select(1) end,
      desc = "Harpoon 1",
    },
    {
      "<Leader>h2",
      function() require("harpoon"):list():select(2) end,
      desc = "Harpoon 2",
    },
    {
      "<Leader>h3",
      function() require("harpoon"):list():select(3) end,
      desc = "Harpoon 3",
    },
    {
      "<Leader>h4",
      function() require("harpoon"):list():select(4) end,
      desc = "Harpoon 4",
    },

    {
      "<C-S-P>",
      function() require("harpoon"):list():prev() end,
      desc = "Previous harpoon",
    },

    {
      "<C-S-N>",
      function() require("harpoon"):list():next() end,
      desc = "Next harpoon",
    },
  },
}
