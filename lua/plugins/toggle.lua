-- https://github.com/folke/snacks.nvim/blob/main/docs/toggle.md

local function make_config(_, opts)
  require("snacks").setup(opts)

  local toggle = require("snacks.toggle")
  -- print(vim.inspect(toggle))

  function toggle.color_indicator(toggle_opts)
    local highligh_color = require("nvim-highlight-colors")

    return toggle.new({
      name = "Color indicator",
      get = function() return highligh_color.is_active() end,
      set = function() highligh_color.toggle() end,
    }, toggle_opts)
  end

  toggle.color_indicator():map("<Leader>tc")
end

return {
  "folke/snacks.nvim",
  opts = {
    toggle = {}
  },
  config = make_config,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        -- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tn")
        Snacks.toggle.diagnostics():map("<leader>td")
        -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>tt")
        -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>th")

        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
      end,
    })
  end,
}

