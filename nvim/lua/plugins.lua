vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    use 'alvan/vim-closetag'
    use 'tpope/vim-eunuch'
    use 'wakatime/vim-wakatime'
    use 'tpope/vim-surround'
    use 'Yggdroot/indentLine'
    use 'honza/vim-snippets'
    use 'vim-airline/vim-airline'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
    use 'rust-lang/rust.vim'
    use 'jiangmiao/auto-pairs'
    use { 'junegunn/fzf', run = './install --all' }
    use 'junegunn/fzf.vim'
    use 'tpope/vim-commentary'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
