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

-- LSP configurations
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require('lsp/javascript-lsp')
