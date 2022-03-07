local null_ls = require('null-ls');

local formatting = null_ls.builtins.formatting

null_ls.setup({
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
    sources = {
        formatting.black,
        formatting.isort,
        formatting.prettier,
        formatting.gofmt,
        formatting.golines,
        formatting.gofumpt
    },
})
