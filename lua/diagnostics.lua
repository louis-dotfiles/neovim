vim.diagnostic.config({
    -- virtual_text = true,
    virtual_lines = true,
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

vim.api.nvim_create_autocmd("LspAttach", {
  --group = lspgroup,
  callback = function(event)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, { buffer = event.buf })
  end
})

