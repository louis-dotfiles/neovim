
vim.api.nvim_create_autocmd("LspAttach", {
  --group = lspgroup,
  callback = function(event)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, { buffer = event.buf })
  end
})

