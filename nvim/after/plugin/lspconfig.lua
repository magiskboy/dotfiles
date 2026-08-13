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

vim.lsp.config('clangd', {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }
})
vim.lsp.enable('clangd')

vim.lsp.enable('ts_ls')

vim.lsp.config('yamlls', {
    filetypes = { 'yaml' }
})
vim.lsp.enable('yamlls')

vim.lsp.enable('terraformls')
vim.lsp.enable('jsonls')
