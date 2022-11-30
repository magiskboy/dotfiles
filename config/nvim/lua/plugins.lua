vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'vim-test/vim-test'
    use "nathom/filetype.nvim"
    use 'lewis6991/impatient.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'ap/vim-css-color'
    use 'neovim/nvim-lspconfig'
    use 'alvan/vim-closetag'
    use 'tpope/vim-eunuch'
    use 'wakatime/vim-wakatime'
    use 'tpope/vim-surround'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-commentary'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'akinsho/git-conflict.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 
            {'akinsho/bufferline.nvim', tags = '2.*'},
            {'arkav/lualine-lsp-progress'}
        }
    }
    use 'ray-x/lsp_signature.nvim'
    use 'akinsho/toggleterm.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use 'Mofiqul/vscode.nvim'
    use 'lifepillar/vim-solarized8'
    use 'vv9k/vim-github-dark'
    use 'cormacrelf/vim-colors-github'
    use 'nvim-pack/nvim-spectre'
    use 'simrat39/symbols-outline.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'onsails/lspkind.nvim'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    }
end)
