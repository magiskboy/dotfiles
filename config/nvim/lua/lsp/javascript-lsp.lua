require'lspconfig'.tsserver.setup {}

vim.cmd([[
autocmd FileType javascript,typescript,typescriptreact,javascriptreact,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting()
autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting()
]])
