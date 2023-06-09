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

lsp.pylsp.setup{
    handlers = handlers,
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                }
            }
        }
    } 
}

lsp.tsserver.setup({
    root_dir = util.root_pattern("*.js", "*.ts", "*.tsx", "*.jsx"),
    handlers = handlers
})

lsp.yamlls.setup{}
