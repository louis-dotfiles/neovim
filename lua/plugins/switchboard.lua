-- https://github.com/louis-neovim-plugins/switchboard

---@type SwitchboardSwitch
local color_preview_switch = {
    label = "Color preview",
    is_on = function () return require("nvim-highlight-colors").is_active() end,
    keymap = {
        "c",
        function () require("nvim-highlight-colors").toggle() end,
    },
}


---@param _ any
---@param opts SwitchboardOpts
local function make_config(_, opts)
    local switches = require("switchboard.builtins").switches

    opts.switches = {
        color_preview_switch,
        switches.make_diagnostics_switch("d"),
        switches.make_inlay_hints_switch("h"),
        switches.make_relative_line_numbers_switch("r"),
        switches.make_line_wrap_switch("w"),
    }

    require("switchboard").setup(opts)
end

return {
    -- "louis-neovim-plugins/switchboard",
    dir = "~/Documents/louis/switchboard",
    enabled = false,
    config = make_config,
    keys = {
        {
            "<leader>s",
            "<cmd>Switchboard<CR>",
            desc = "Switchboard",
        },
    },
}

