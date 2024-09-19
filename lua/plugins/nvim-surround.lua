-- https://github.com/kylechui/nvim-surround

local function make_options()
  return {
    keymaps = {
      normal = "sa",
      delete = "sd",
      change = "sr",
      visual = "S",
    },
  }
end

return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features.
  event = "VeryLazy",
  opts = make_options,
}

