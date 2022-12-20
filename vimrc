set path+=**
set wildmenu
set number
set numberwidth=5
set tabstop=4 shiftwidth=4 expandtab
set undofile noswapfile nobackup
set undodir=/tmp
set laststatus=2
set background=dark

command! Maketags %!ctags -R .
command! JsonMinify %!jq -c .
command! JsonBeauty %!jq .

augroup indent_file
  autocmd FileType xml,yaml,json setlocal ts=2 sts=2 sw=2
  autocmd FileType javascript,typescript,jsx setlocal ts=2 sts=2 sw=2
  autocmd FileType html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
augroup END
nmap J 5j
nmap K 5k
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
