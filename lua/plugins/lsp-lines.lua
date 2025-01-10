-- https://git.sr.ht/~whynothugo/lsp_lines.nvim

-- ---comment
-- ---@param arg1 string
-- ---@param arg2 number
-- local function test(arg1, arg2) end
--
-- test('asdad', true)

local function make_config(_, opts)
  vim.diagnostic.config({
    -- virtual_lines = { only_current_line = true },
    -- virtual_text = false,
  })
end

return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  opts = {},
  config = make_config,
}

