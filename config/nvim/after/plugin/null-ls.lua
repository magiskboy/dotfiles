local null_ls = require('null-ls');

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

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
        formatting.prettierd,
        formatting.gofmt,
        formatting.clang_format,

        diagnostics.pylint,
        diagnostics.eslint,
        diagnostics.clang_check,
    },
})
