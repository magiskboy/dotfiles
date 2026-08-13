return {
    -- AI coding
    {
        "nickjvandyke/opencode.nvim",
        version = "*",
    },

    -- Theme
    'navarasu/onedark.nvim',

    -- LSP and signature
    'williamboman/mason.nvim',
    {
        'williamboman/mason-lspconfig.nvim',
        version = 'v1.32.0',
    },
    {
        'neovim/nvim-lspconfig',
        version = 'v2.11.0'
    },
    -- Code tools
    'alvan/vim-closetag',
    'tpope/vim-surround',
    'windwp/nvim-autopairs',
    'lewis6991/gitsigns.nvim',
    'tpope/vim-commentary',
    'tpope/vim-eunuch',
    {
        'nvim-telescope/telescope.nvim',
        version = '^0.1.8',
        dependencies = {
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
    },

    -- UI enhancements
    'kyazdani42/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
    },
    {
        'hrsh7th/nvim-cmp',
        version = 'v0.0.2',
        dependencies = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'akinsho/bufferline.nvim',
            'arkav/lualine-lsp-progress',
        }
    },

    -- Other utilities
    'xiyaowong/transparent.nvim',
    'nvim-lua/plenary.nvim',
}

