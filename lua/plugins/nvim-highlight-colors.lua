-- https://github.com/brenoprata10/nvim-highlight-colors

return {
  "brenoprata10/nvim-highlight-colors",
  opts = {
    render = "virtual",
    virtual_symbol = " ",
    virtual_symbol_position = "eol",
    exclude_filetypes = {
      "lazy", -- Lots of git hashes that are interpreted as color codes, and no colors expected in the filetype.
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "<F4>",
      "<cmd>HighlightColors Toggle<cr>",
      desc = "Toggle color highlighting",
    },
  }
}

