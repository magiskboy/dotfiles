local util = require'lspconfig'.util
local lsp = require('lspconfig');
local null_ls = require("null-ls")

local border = {
    {"┌", "FloatBorder"},
    {"─", "FloatBorder"},
    {"┐", "FloatBorder"},
    {"│", "FloatBorder"},
    {"┘", "FloatBorder"},
    {"─", "FloatBorder"},
    {"└", "FloatBorder"},
    {"│", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- setup language server

lsp.jedi_language_server.setup{ handlers = handlers }

lsp.tsserver.setup({
    root_dir = util.root_pattern("*.js", "*.ts", "*.tsx", "*.jsx"),
    handlers = handlers
})

lsp.gopls.setup{
    root_dir = util.root_pattern("go.mod", ".git", "*.go"),
    handlers = handlers
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
lsp.clangd.setup{ handlers = handlers, capabilities = capabilities }

lsp.rust_analyzer.setup{}

lsp.yamlls.setup{
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml"
            },
      }
    }
}

null_ls.setup({
    sources = {
        -- python
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.black,
        -- javascript
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d,
        -- golang
        null_ls.builtins.formatting.gofmt,
        -- clang
        null_ls.builtins.formatting.clang_format,
    },
})
