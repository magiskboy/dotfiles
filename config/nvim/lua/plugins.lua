vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'ap/vim-css-color'
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'alvan/vim-closetag'
    use 'tpope/vim-eunuch'
    use 'wakatime/vim-wakatime'
    use 'tpope/vim-surround'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-commentary'
    use 'arkav/lualine-lsp-progress'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'romgrk/barbar.nvim'
    use 'kdheepak/tabline.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'akinsho/toggleterm.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use 'Mofiqul/vscode.nvim'
    use 'nvim-pack/nvim-spectre'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/vim-vsnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' }
        }
    }
end)
