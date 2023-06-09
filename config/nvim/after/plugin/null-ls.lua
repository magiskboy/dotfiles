local null_ls = require('null-ls');

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.prettier,
        formatting.prettierd,
        formatting.gofmt,
        formatting.clang_format,
        formatting.ruff,
        formatting.isort,
        formatting.black,

        diagnostics.ruff,
        diagnostics.eslint,
        diagnostics.clang_check,
    },
})
