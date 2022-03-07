filetype plugin on
syntax on

set path+=**

set wildmenu

set number
set numberwidth=5

command! Maketags %!ctags -R .

command! JsonMinify %!jq -c .
command! JsonBeauty %!jq .

set tabstop=4 shiftwidth=4 expandtab

set undofile noswapfile nobackup
set undodir=/tmp

set laststatus=2
colorscheme elflord
let mapleader = ","

nmap J 5j
nmap H 5h
nmap K 5k
nmap L 5l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#StatusLine#
set statusline+=%{StatuslineGit()}
set statusline+=%#TabLineSel#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
