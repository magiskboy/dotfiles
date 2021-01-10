filetype plugin indent on

" Set true support color
set termguicolors

set t_Co=256

colorscheme ayu
let ayucolor="dark"

syntime on

" Don't make Vim vi-compatibile.
set nocompatible

" Enable syntax highlighting.
syntax on

set shell=/bin/bash

" Don't break line when width line more than width window
set wrap

set regexpengine=1

set noshowcmd

set updatetime=10

" Copy indent to the new line.
set autoindent

" Yank and paste with system clipboard
set clipboard=unnamed

" Highlight certain column(s).
set colorcolumn=0

set signcolumn=yes

" No highlight the current line.
set nocursorline

" Use UTF-8 without BOM.
set encoding=utf-8 nobomb

" Enable search highlighting.
set hlsearch

" Ignore case in search patterns.
set noignorecase

" Highlight search pattern
set incsearch

" Do not redraw the screen while
" set lazyredraw

" Hide mouse pointer while typing.
set mousehide

" Show line number.
set number numberwidth=5

" Set border for window
set fillchars+=vert:│

" Show cursor position.
set ruler

 " Limit syntax highlighting (this avoids the very slow redrawing when files contain long lines).
set synmaxcol=200

syntax sync minlines=100

" Set global <TAB> settings.
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Enable fast terminal connection.
set ttyfast

" Automatically save undo history.
set undofile noswapfile nobackup
set undodir=/tmp

" Allow cursor to be anywhere.
" set virtualedit=all

" Disable beeping and window flashing
set novisualbell
set noerrorbells
set t_vb=

" Completion (by hitting <TAB> in command mode, Vim will show the possible
" matches just above the command line with the first match highlighted).
" Enable enhanced command-line
set wildmenu
" Allow windows to be squashed.
set winminheight=0

" Enable folding
set foldmethod=indent
set foldlevel=99

" Show status line
set laststatus=2

" Disable messge popup in macvim
set guioptions+=c

set diffopt+=vertical

set regexpengine=1

let g:python3_host_prog = expand('$PYENV_ROOT/shims/python')
let g:python_host_prog = expand('/usr/bin/python')

" ============= Ident line ==============
" Set indent line guide character
let g:indentLine_char = '│'

" Set color for ident line
let g:indentLine_color_term = 239

" ============= NERD Tree ===============
" Ignore entries for NERDTree
let NERDTreeIgnore = [
    \'node_modules', 'bower_components', 'build', 'dist',
    \'env/', 'venv', '__pycache__', '.pytest_cache',
    \'*.class','*.egg-info/'
    \]

let NERDTreeMinimalUI = 1

" Move NERD to right side screen
let g:NERDTreeWinPos = "right"

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" ============= Auto pair shortcut toggle ===========
let g:AutoPairsShortcutToggle = ""

" ============= Vim airline ==============
let g:airline_extensions = ['branch', 'hunks', 'ale', 'coc', 'tabline']

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'warning', 'error']]

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

let g:airline_theme='simple'

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

" Configure error/warning section to use ale.nvim
let airline#extensions#ale = {
    \'error_symbol': 'E:',
    \'warning_synbol': 'W:'
    \}
"============== ALE ================
let g:ale_enabled = 0

" Define ALE linter
let b:ale_linters = {
    \'javascript': ['eslint'],
    \'typescript': ['tslint'],
    \'python': ['pylint', 'mypy'],
    \'c': ['ccls']
    \}

" Setting icon before error/warning ale
let g:ale_sign_error = '*'
let g:ale_sign_warning = '*'

" Format ALE message
let g:ale_python_pylint_use_msg_id = 1
let g:ale_echo_msg_format = '[%linter%] [%code%] %s [%severity%]'

" Disable ale warning/error in buffer
let g:ale_set_highlights = 0

" Setting ale window
let g:ale_open_list = 0

let g:rust_clip_command = 'pbcopy'

" ============= Tagbar ===============
" Set dropdown for tagbar
let g:tagbar_iconchars = ['▸', '▾']

let g:one_allow_italics = 1

" ========== vim-test ============
let test#strategy = {
  \ 'nearest': 'basic',
  \ 'file':    'basic',
  \ 'suite':   'basic',
\}


let g:coc_enabled = 0

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
