-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#available-components

---Highlight a string with the given highlight group.
---
---@param highlight_group string Highlight group name.
---@param text string String to be hihglighted.
---@return string highlighted_string
local function highlight_text(highlight_group, text)
  return table.concat({ "%#", highlight_group, "#", text, "%*" })
end

---Returns a visual indication of the visual selection.
---e.g. 󰒉 3l
---e.g. 󰒉 -11c
---e.g. 󰒉 3l x 2c
---
---@return string
local function visual_selection_module()
    local mode = vim.api.nvim_get_mode().mode

    local active_modes = { "v", "V", "" }
    if not vim.tbl_contains(active_modes, mode) then return "" end

    local icon = "󰒉 "
    local _, line_start, col_start = unpack(vim.fn.getpos("v"))
    local _, line_end, col_end = unpack(vim.fn.getpos("."))

    local line_diff = line_end - line_start
    local col_diff = col_end - col_start

    local line_count = line_diff >= 0 and line_diff + 1 or line_diff - 1
    local col_count = col_diff >= 0 and col_diff + 1 or col_diff - 1

    local text = ""
    if mode == "v" then
        if line_diff ~= 0 then
            text = tostring(line_count) .. "l"
        else
            text = tostring(col_count) .. "c"
        end
    elseif mode == "V" then
        text = tostring(line_count) .. "l"
    else
        text = line_count .. "l x " .. col_count .. "c"
    end

    return icon .. text
end


---Returns a visual indication of the search position and total results.
---e.g.  03/12
---
---@return string
local function search_count_module()
    if vim.v.hlsearch ~= 1 then return '' end

    local icon = " "
    local search_info = vim.fn.searchcount({ maxcount = 0 })

    local text = ''
    if search_info.incomplete == 1 then
        text = ''
    else
        local total_char_length = string.len(search_info.total)
        -- Format string to display.
        local format_string = '%0' .. total_char_length .. 'd/%d'
        text = string.format(
            format_string,
            search_info.current,
            search_info.total
        )
    end

    return icon .. text
end

-- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/extensions/trouble.lua

---Format mode, eg: lsp_document_symbols -> Lsp Document Symbols
---@param mode string
---@return string
local function _format_mode(mode)
    local words = vim.split(mode, '[%W]')
    for i, word in ipairs(words) do
        words[i] = word:sub(1, 1):upper() .. word:sub(2)
    end

    return table.concat(words, ' ')
end

local function get_trouble_mode()
    local opts = require('trouble.config').options
    if opts ~= nil and opts.mode ~= nil then
        local text = _format_mode(opts.mode)
        return highlight_text("Normal", text)
    end

    local win = vim.api.nvim_get_current_win()
    if vim.w[win] ~= nil then
        local trouble = vim.w[win].trouble
        if trouble ~= nil and trouble.mode ~= nil then
            local text = _format_mode(trouble.mode)
            return highlight_text("Normal", text)
        end
    end

    return 'Trouble'
end


local winbar_conf = {
    -- Left side.
    lualine_a = {},
    lualine_b = {
        { 'filename', path = 1 },
    },
    lualine_c = { "navic" },

    -- Right side.
    lualine_x = {},
    lualine_y = {
        {
            'diagnostics',

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { 'nvim_diagnostic' },

            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
            },
            symbols = {
                -- error = 'E',
                -- warn = 'W',
                -- info = 'I',
                -- hint = 'H',
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
        },
        {
            'lsp_status',
            icon = '',
            symbols = {
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                -- Standard unicode symbol for when LSP is done:
                done = '✓',
                -- Delimiter inserted between LSP names:
                separator = ' ',
            },
        },
        'filetype',
    },
    lualine_z = {},
}


local statusline_conf = {
    -- Left side.
    lualine_a = { "mode" },
    lualine_b = {
        { "branch", icon = "" },
        {
            "diff",
            symbols = {
                added = " ",
                modified = " ",
                removed = " ",
            },
        },
    },
    lualine_c = {
        {
            'diagnostics',

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { 'nvim_workspace_diagnostic' },

            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
            },
            symbols = {
                -- error = 'E',
                -- warn = 'W',
                -- info = 'I',
                -- hint = 'H',
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
        },

    },

    -- Right side.
    lualine_x = { "harpoon2" },
    lualine_y = {
        visual_selection_module,
        search_count_module,
    },
    lualine_z = {
        "progress",
    },
}


return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        {
            "letieu/harpoon-lualine",
            dependencies = { "ThePrimeagen/harpoon", branch = "harpoon2" },
        },
        {
            "SmiteshP/nvim-navic",
            dependencies = "neovim/nvim-lspconfig"
        },
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            globalstatus = true,
            disabled_filetypes = {
                statusline = {},
                winbar = {
                    "neo-tree",
                },
            },
        },
        sections = statusline_conf,
        winbar = winbar_conf,
        inactive_winbar = winbar_conf,

        -- Use that to configure lualine for specific filetypes.
        extensions = {
            trouble = {
                winbar          = { lualine_b = { get_trouble_mode } },
                inactive_winbar = { lualine_b = { get_trouble_mode } },
                filetypes = {
                    "trouble",
                    "Trouble",
                },
            },
        },
    },
}

