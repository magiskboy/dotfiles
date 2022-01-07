vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'tpope/vim-fugitive'
    use 'alvan/vim-closetag'
    use 'tpope/vim-eunuch'
    use 'wakatime/vim-wakatime'
    use 'tpope/vim-surround'
    use 'Yggdroot/indentLine'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
    -- use 'rust-lang/rust.vim'
    use  'easymotion/vim-easymotion' 
    use { 'junegunn/fzf', run = './install --all' }
    use 'tpope/vim-commentary'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use  'voldikss/vim-floaterm' 
    use 'samoshkin/vim-mergetool'
    use 'vim-scripts/ebnf.vim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        -- tag = 'release' -- To use the latest release
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
    }
    use 'kdheepak/lazygit.nvim'
end)
