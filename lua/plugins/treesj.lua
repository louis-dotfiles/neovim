-- https://github.com/Wansmer/treesj

local function toggle_split()
  require("treesj").toggle()
end

return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
  keys = {
    {
      "gs",
      toggle_split,
      desc = "Toggle join/split"
    },
  },
}

