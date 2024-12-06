-- https://github.com/lewis6991/gitsigns.nvim

return {
  "lewis6991/gitsigns.nvim",
  opts = {},
  event = "VeryLazy",
  keys = {
    {
      "<leader>gp",
      function () require("gitsigns").preview_hunk() end,
      desc = "Preview",
    },
    {
      "<leader>gb",
      function () require("gitsigns").blame_line() end,
      desc = "Blame",
    },
    {
      "<leader>gr",
      function () require("gitsigns").reset_hunk() end,
      desc = "Reset hunk",
    },
    {
      "<leader>gR",
      function () require("gitsigns").reset_buffer() end,
      desc = "Reset buffer",
    },
  },
}

