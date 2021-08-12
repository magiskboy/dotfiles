vim.cmd [[packadd packer.nvim]]

vim.cmd([[
filetype off
set rtp+=~/.config/nvim/bundle/vim-plug
call plug#begin('~/.vim/bundle')
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-eunuch'
Plug 'wakatime/vim-wakatime'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
filetype plugin indent on
]])

vim.cmd([[
set termguicolors
set t_Co=256
colorscheme gruvbox
syntax on
syntime on
]])


vim.o.shell = "/bin/bash"
vim.o.wrap = true
vim.o.showcmd = false 
vim.o.autoindent = true
vim.o.cursorline = false
vim.o.ignorecase = false
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.numberwidth = 5
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.undofile = true
vim.swapfile = true
vim.backup = true
vim.o.undodir = "/tmp"
vim.o.wildmenu = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.laststatus = 2

vim.g.python3_host_prog = vim.api.nvim_eval("expand('~/.pyenv/shims/python')")
vim.g.python_host_prog = vim.api.nvim_eval("expand('/usr/bin/python2')")
vim.g.indentLine_enabled = 1
vim.g.indentLine_char = '│'
vim.g.indentLine_color_term = 239
vim.g.AutoPairsShortcutToggle = ""
vim.g.airline_skip_empty_sections = 1
vim.g.airline_highlighting_cache = 1
vim.g.airline_extensions = { 'branch', 'hunks', 'coc', 'tabline' }
vim.g.airline_left_sep = ''
vim.g.airline_right_sep = ''
vim.g.fzf_layout = { down = '~100%' }
vim.g.coc_global_extensions = {
    'coc-json',
    'coc-tsserver',
    'coc-rust-analyzer',
    'coc-clangd',
    'coc-go',
    'coc-python',
    'coc-jedi',
    'coc-eslint',
    'coc-prettier',
    'coc-explorer',
    'coc-css'
}
vim.api.nvim_set_var("airline#extensions#tabline#formatter", 'default')
vim.api.nvim_set_var("airline#extensions#tabline#tab_nr_type", "1")
vim.api.nvim_set_var("airline#extensions#tabline#show_tab_nr", "1")
vim.api.nvim_set_var("airline#extensions#tabline#left_sep", '')
vim.api.nvim_set_var("airline#extensions#tabline#right_sep", '')
vim.api.nvim_set_var("airline#extensions#tabline#left_alt_sep", ' ')
vim.api.nvim_set_var("airline#extensions#tabline#right_alt_sep", ' ')
vim.api.nvim_set_var('airline#extensions#default#layout', {{'a', 'b', 'c'}, {'x', 'y', 'z', 'warning', 'error'}})

vim.g.mapleader = ','
vim.api.nvim_set_keymap('', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('', '<C-l>', '<C-w>l', {})
vim.api.nvim_set_keymap('', '<C-s>', ':write<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>1', '<Plug>AirlineSelectTab1', {})
vim.api.nvim_set_keymap('n', '<leader>2', '<Plug>AirlineSelectTab2', {})
vim.api.nvim_set_keymap('n', '<leader>3', '<Plug>AirlineSelectTab3', {})
vim.api.nvim_set_keymap('n', '<leader>4', '<Plug>AirlineSelectTab4', {})
vim.api.nvim_set_keymap('n', '<leader>5', '<Plug>AirlineSelectTab5', {})
vim.api.nvim_set_keymap('n', '<leader>6', '<Plug>AirlineSelectTab6', {})
vim.api.nvim_set_keymap('n', '<leader>7', '<Plug>AirlineSelectTab7', {})
vim.api.nvim_set_keymap('n', '<leader>8', '<Plug>AirlineSelectTab8', {})
vim.api.nvim_set_keymap('n', '<leader>9', '<Plug>AirlineSelectTab9', {})
vim.api.nvim_set_keymap('i', '<tab>', 'pumvisible() ? "<c-n>" : "<tab>"', { expr = true })
vim.api.nvim_set_keymap('n', '<C-r>', '<Plug>(coc-rename)', { silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })
vim.api.nvim_set_keymap('n', '<C-e>', ':CocCommand explorer --toggle<cr>', {})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<cr>', {})
vim.api.nvim_set_keymap('n', 'U', ':redo<cr>', {})
vim.api.nvim_set_keymap('n', 'nh', ':noh<cr>', {})
vim.api.nvim_set_keymap('n', '<C-q>', ':quit<cr>', {})

vim.cmd([[
hi GitGutterAdd ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermbg=NONE guibg=NONE
hi GitGutterChange ctermbg=NONE guibg=NONE 
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi SignColumn guibg=NONE
]])

vim.cmd([[
autocmd FileType json let g:indentLine_setConceal = 0
autocmd BufWritePost * GitGutter
autocmd FileType javascript,typescript,jsx,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
]])

require'nvim-treesitter.configs'.setup { 
    ensure_installed = {
        "html",
        "typescript",
        "javascript",
        "tsx",
        "css",
        "scss",
        "python",
        "rust",
        "go",
        "dockerfile",
        "json",
        "yaml",
        "lua",
        "bash",
        "c",
        "cpp",
        "cmake",
        "toml",
        "java",
    },

    highlight = {
        enable = true,
    }
}

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    use 'alvan/vim-closetag'
    use 'tpope/vim-eunuch'
    use 'wakatime/vim-wakatime'
    use 'Yggdroot/indentLine'
    use 'vim-airline/vim-airline'
    use 'neoclide/coc.nvim'
    use 'fatih/vim-go'
    use 'rust-lang/rust.vim'
    use 'jiangmiao/auto-pairs'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-commentary'
    use 'nvim-treesitter/nvim-treesitter'
end)
