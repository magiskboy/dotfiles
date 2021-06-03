scriptencoding utf-8

filetype off
set rtp+=~/.config/nvim/bundle/vim-plug
call plug#begin('~/.vim/bundle')
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'wakatime/vim-wakatime'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'voldikss/vim-floaterm'
call plug#end()

" ==================== CONFIG COLORSCHEMA =================
filetype plugin indent on
set termguicolors
set t_Co=256
colorscheme gruvbox
syntax on

" ==================== CONFIG SYSTEM =======================
syntime on
set nocompatible
set shell=/bin/bash
set wrap
set regexpengine=1
set noshowcmd
set updatetime=300
set autoindent
set clipboard=unnamed
set colorcolumn=0
set nocursorline
set encoding=utf-8 nobomb
set incsearch
set noignorecase
set hlsearch
set lazyredraw
set mousehide
set mouse=a
set number numberwidth=5 relativenumber
set fillchars+=vert:│
set ruler
set synmaxcol=200
syntax sync minlines=100
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ttyfast
set undofile noswapfile nobackup
set undodir=/tmp
set novisualbell
set noerrorbells
set t_vb=
set wildmenu
set winminheight=0
set foldmethod=indent
set foldlevel=99
set laststatus=2
set guioptions+=c
set diffopt+=vertical
set signcolumn=number

" ==================== CONFIG PLUGIN =======================
let g:python3_host_prog = expand('~/.pyenv/shims/python')
let g:python_host_prog = expand('/usr/bin/python2')

let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 239

let g:AutoPairsShortcutToggle = ""

let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'warning', 'error']]
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

let g:coc_global_extensions = [
    \'coc-json',
    \'coc-tsserver',
    \'coc-rust-analyzer',
    \'coc-clangd',
    \'coc-go',
    \'coc-python',
    \'coc-jedi',
    \'coc-eslint',
    \'coc-prettier',
    \'coc-explorer',
    \'coc-css'
    \]

let g:tagbar_iconchars = ['▸', '▾']
let g:fzf_layout = { 'down': '~50%' }

autocmd FileType json let g:indentLine_setConceal = 0
autocmd BufWritePost * GitGutter
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType javascript,typescript,jsx,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2


" ==================== KEYMAP =======================
let mapleader=","
nmap <C-e> :CocCommand explorer --toggle<cr>
nmap <C-p> :CocList commands<cr>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <leader>p :Files<cr>
nmap <leader>r :Rg<cr>
nmap nh :noh<cr>
nnoremap <space> za
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" =================== CUSTOM COLORSCHEMA =============
hi GitGutterAdd ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermbg=NONE guibg=NONE
hi GitGutterChange ctermbg=NONE guibg=NONE 
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi SignColumn guibg=NONE
hi ColorColumn guibg=#30353b

" =================== USEFUL FUNCTION ================
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
