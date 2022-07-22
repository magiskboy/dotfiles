call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
call plug#end()

filetype plugin on
syntax on
colorscheme codedark

set path+=**
set wildmenu
set number
set numberwidth=5
set tabstop=4 shiftwidth=4 expandtab
set undofile noswapfile nobackup
set undodir=/tmp
set laststatus=2

command! Maketags %!ctags -R .
command! JsonMinify %!jq -c .
command! JsonBeauty %!jq .

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

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('H', 'in')
  endif
endfunction

let mapleader = ","
let NERDTreeMinimalUI=1
let g:NERDTreeStatusline = ''
let g:NERDTreeWinPos = "right"
let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']

nmap J 5j
nmap K 5k
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-p> :Files<cr>
nmap <C-f> :Rg<cr>
nmap <Tab> :NERDTreeToggle<cr>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> H :call ShowDocumentation()<CR>

hi GitGutterAdd cterm=BOLD ctermbg=NONE ctermfg=green gui=BOLD guibg=NONE guifg=lightgreen
hi GitGutterDelete cterm=BOLD ctermbg=NONE ctermfg=red gui=BOLD guibg=NONE guifg=red
hi GitGutterChange cterm=BOLD ctermbg=NONE ctermfg=lightblue gui=BOLD guibg=NONE guifg=lightblue
