local util = require'lspconfig'.util

require'lspconfig'.gopls.setup{
    root_dir = util.root_pattern("go.mod", ".git", "*.go"),
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end,
}
