local null_ls = require('null-ls');

local formatting = null_ls.builtins.formatting

null_ls.setup({
    on_attach = function()
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
        augroup END
        ]])
    end,
    sources = {
        formatting.black,
        formatting.isort,
        formatting.prettier,
        formatting.gofmt,
        -- formatting.golines,
        -- formatting.gofumpt
    },
})
