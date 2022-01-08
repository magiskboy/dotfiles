require'lspconfig'.tsserver.setup {}

vim.cmd([[
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
]])
