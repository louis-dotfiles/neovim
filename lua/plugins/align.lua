-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md

-- The keybind setup is weird because:
-- - The plugin defines its own mappings.
-- - The plugin documentation is not clear enough and I could not understand which function to call in a custom mappings of my own.
-- - I want to lazy load this plugin when the mapping is used.

local keybinding = "ga"

return {
  "echasnovski/mini.align",
  version = "*",
  opts = {
    mappings = {
      start_with_preview = keybinding,
      start = nil,
    },
    -- Default behavior.
    options = {
      split_pattern = " ",
      justify_side = "left",
      merge_delimiter = "",
    },
  },
  -- Doesn't work as I would like.
  keys = {
    {
      keybinding,
      mode = { "v" },
      desc = "Align text",
    },
  },
}

