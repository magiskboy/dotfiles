local util = require'lspconfig'.util
local lsp = require('lspconfig');

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.gopls.setup{
    root_dir = util.root_pattern("go.mod", ".git", "*.go"),
    handlers = handlers,
    capabilities = capabilities
}

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
