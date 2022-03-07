require("lspconfig").tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
})

vim.cmd([[
    autocmd FileType javascript,typescript,typescriptreact,javascriptreact,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
]])
