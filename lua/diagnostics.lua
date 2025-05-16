vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    float = { border = "rounded" },
    severity_sort = true,
})


local modes = {
    "virtual_text",
    "virtual_lines",
}
local active_mode_index = 1
vim.diagnostic.config({ [modes[active_mode_index]] = true })

---Cycles through diagnostics disaply modes.
---Virtual text tends to go "offscreen" on longer lines, and cannot be read.
---Virtual lines are invasive when there are a lot of errors.
local function cycle_diagnostic_mode()
    active_mode_index = math.fmod(active_mode_index, #modes) + 1

    local config = {}
    for _, mode in pairs(modes) do
        config[mode] = false
    end

    config[modes[active_mode_index]] = true

    vim.diagnostic.config(config)
end


vim.api.nvim_create_autocmd("LspAttach", {
    --group = lspgroup,
    callback = function(event)
        vim.keymap.set(
            "n",
            "K",
            function() vim.lsp.buf.hover({ border = "rounded" }) end,
            {
                buffer = event.buf,
                desc = "Show the LSP definition",
            }
        )
        vim.keymap.set(
            "n",
            "<leader>dm",
            cycle_diagnostic_mode,
            { desc = "Cycle through diagnostic display modes" }
        )
    end
})

