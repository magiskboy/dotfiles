vim.lsp.enable('pyright')
vim.lsp.enable('ruff')

vim.lsp.config('gopls', {
    filetypes = { 'go' }
})
vim.lsp.enable('gopls')

vim.lsp.config('rust_analyzer', {
    cmd = { '/home/thanh/.cargo/bin/rust-analyzer' }
})
vim.lsp.enable('rust_analyzer')

vim.lsp.enable('clangd')

vim.lsp.enable('ts_ls')

vim.lsp.enable('yamlls')
vim.lsp.enable('terraformls')
vim.lsp.enable('jsonls')
