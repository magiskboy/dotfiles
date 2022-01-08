vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'morhetz/gruvbox'
    use 'alvan/vim-closetag'
    use 'tpope/vim-eunuch'
    use 'wakatime/vim-wakatime'
    use 'tpope/vim-surround'
    use 'Yggdroot/indentLine'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-commentary'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'voldikss/vim-floaterm' 
    use 'arkav/lualine-lsp-progress'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'jose-elias-alvarez/null-ls.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
    }
end)
