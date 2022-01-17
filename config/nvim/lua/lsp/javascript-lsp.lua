require'lspconfig'.tsserver.setup {}

vim.cmd([[
autocmd FileType javascript,typescript,typescriptreact,javascriptreact,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
]])

