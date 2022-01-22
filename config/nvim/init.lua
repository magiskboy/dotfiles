require('plugins')
require('config')
require('keymaps')

-- Plugin configurations
require('plugins/nvim-tree-config')
require('plugins/gitsigns-config')
require('plugins/lualine-config')
require('plugins/nvim-treesitter-config')
require('plugins/telescope-config')
require('plugins/nvim-cmp-config')
require('plugins/lsp_signature-config')
require('plugins/barbar-config')
require('plugins/toggleterm-config')
require('plugins/indent-blankline-config')
require('plugins/lsp-config')
require('plugins/nvim-treesitter-context-config')
require('plugins/git-blame-config')
require('plugins/null-ls-config')

-- LSP configurations
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require('lsp/javascript-lsp')
require('lsp/jedi-lsp')
require('lsp/lua-lsp')


require("lspconfig").tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
})

require("null-ls").setup({
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
        require("null-ls").builtins.formatting.prettier,
    },
})
