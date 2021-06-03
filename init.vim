scriptencoding utf-8

filetype off
set rtp+=~/.config/nvim/bundle/vim-plug
call plug#begin('~/.vim/bundle')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'wakatime/vim-wakatime'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
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
set updatetime=10
set autoindent
set clipboard=unnamed
set colorcolumn=0
set signcolumn=yes
set nocursorline
set encoding=utf-8 nobomb
set hlsearch
set noignorecase
set incsearch
set lazyredraw
set mousehide
set mouse=a
set number numberwidth=5 norelativenumber
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
set regexpengine=1


" ==================== CONFIG PLUGIN =======================
let g:python3_host_prog = expand('~/.pyenv/shims/python')
let g:python_host_prog = expand('/usr/bin/python2')

let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 239

let g:NERDTreeIgnore = [
    \'node_modules', 'bower_components', 'build', 'dist',
    \'env/', 'venv', '__pycache__', '.pytest_cache',
    \'*.class','*.egg-info/'
    \]
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeStatusline = ''
let g:AutoPairsShortcutToggle = ""

let g:airline_extensions = ['branch', 'hunks', 'ale', 'coc', 'tabline']
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

let g:ale_linters = {
    \'javascript': ['eslint'],
    \'typescript': ['tslint'],
    \'python': ['pylint', 'mypy'],
    \'golang': ['golint'],
    \'rust': ['cargo'],
    \'c': ['cc'],
    \'cpp': ['cc']
    \}
let g:ale_fixers = {
    \'javascript': ['prettier', 'eslint'],
    \'typescript': ['prettier'],
    \'python': ['black', 'isort'],
    \'golang': ['gofmt'],
    \'rust': ['rustfmt'],
    \'c': ['clang-format'],
    \'cpp': ['clang-format']
    \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_python_pylint_use_msg_id = 1
let g:ale_echo_msg_format = '[%linter%] [%code%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_open_list = 0

let g:coc_global_extensions = [
    \'coc-json',
    \'coc-tsserver',
    \'coc-rust-analyzer',
    \'coc-clangd',
    \'coc-go',
    \'coc-python',
    \'coc-jedi',
    \'coc-eslint'
    \]

let g:tagbar_iconchars = ['▸', '▾']

autocmd BufWritePost * :silent! %s/\s\+$\| \+\zs\t//g
augroup indent_file
    autocmd FileType xml,yaml,json setlocal ts=2 sts=2 sw=2
    autocmd FileType javascript,typescript,jsx setlocal ts=2 sts=2 sw=2
    autocmd FileType html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
augroup END
autocmd FileType json let g:indentLine_setConceal = 0
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufWritePost * GitGutter

" ==================== KEYMAP =======================
let mapleader = ","
nmap <f8> :TagbarToggle<cr>
nmap <tab> :NERDTreeToggle<cr>
nmap aa :call OpenFloatTerm()<cr>
nmap <leader>p :Files<cr>
nmap <leader>r :Rg<cr>
nmap <leader>w :Windows<cr>
nnoremap <space> za
nmap <F2> :CocCommand document.renameCurrentWord<cr>
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
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
hi GitGutterAdd cterm=BOLD ctermbg=NONE ctermfg=green gui=BOLD guibg=NONE guifg=lightgreen
hi GitGutterDelete cterm=BOLD ctermbg=NONE ctermfg=red gui=BOLD guibg=NONE guifg=red
hi GitGutterChange cterm=BOLD ctermbg=NONE ctermfg=lightblue gui=BOLD guibg=NONE guifg=lightblue
hi ALEWarning cterm=BOLD ctermbg=NONE ctermfg=NONE gui=BOLD guibg=NONE guifg=NONE
hi ALEErrorSign cterm=BOLD ctermbg=NONE ctermfg=red gui=BOLD guibg=NONE guifg=red
hi ALEWarningSign cterm=BOLD ctermbg=NONE ctermfg=white gui=BOLD guibg=NONE guifg=yellow
hi EndOfBuffer cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=bg
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=234 gui=NONE guibg=NONE guifg=grey
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi Pmenu guibg=#444934 guifg=0
hi SignColumn guibg=NONE
hi ColorColumn guibg=#30353b
hi Comment gui=italic
hi MyGroup gui=bold
hi MatchParen guibg=NONE guifg=orange
hi RedundantWhitespace cterm=NONE ctermbg=white ctermfg=NONE gui=NONE guibg=white guifg=NONE
match RedundantWhitespace /\s\+$\| \+\zs\t/
match MyGroup /./

" =================== USEFUL FUNCTION ================
function! OpenFloatTerm()
  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
    \ 'relative': 'editor',
    \ 'row': row - 1,
    \ 'col': col - 2,
    \ 'width': width + 4,
    \ 'height': height + 2,
    \ 'style': 'minimal'
    \ }
  let border_buf = nvim_create_buf(v:false, v:true)
  let s:border_win = nvim_open_win(border_buf, v:true, border_opts)
  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'row': row,
    \ 'col': col,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }
  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)
  terminal
  startinsert
  " Hook up TermClose event to close both terminal and border windows
  autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
endfunction

function! ExecuteCommandInTmux(ident, command)
    let exec_cmd = "tmux send-keys -t '" . a:ident . "' '" . a:command . "' ENTER"
    call system(exec_cmd)
endfunction
