pcall(require, 'impatient')

require('plugins')
require('config')
require('keymaps')

-- Plugin configurations
require('plugins/lualine-config')
require('plugins/bufferline-config')
require('plugins/nvim-tree-config')
require('plugins/gitsigns-config')
require('plugins/nvim-treesitter-config')
require('plugins/telescope-config')
require('plugins/nvim-cmp-config')
require('plugins/lsp_signature-config')
require('plugins/toggleterm-config')
require('plugins/indent-blankline-config')
require('plugins/lsp-config')
require('plugins/git-blame-config')
require('plugins/symbol-outline-config')
require('plugins/notify-config')

require('lsp')
