-- https://github.com/Myzel394/easytables.nvim

local function create_table()
  local function input_handler(input)
      if input == nil or input == "" then
        vim.notify(
          "You must specify the table size like so: {Columns}x{Rows}.\ne.g. `5x3`, or simply `5` for a 5x5 table.",
          vim.log.levels.INFO,
          { title = "EasyTables" }
        )

        return
      end

      vim.cmd("EasyTablesCreateNew " .. input)
  end
  vim.ui.input(
    { prompt = "Create table, chose the size ColsxRows: " },
    input_handler
  )
end

local function table_editor()
  local ok, err = xpcall(
    vim.cmd("EasyTablesImportThisTable"),
    create_table
  )
  -- if err then
  --   create_table()
  --   return
  -- end
end

return {
  "Myzel394/easytables.nvim",
  opts = {},
  keys = {
    -- {
    --   "<Leader>mt",
    --   table_editor,
    --   desc = "Create a table",
    -- },
  },
}

