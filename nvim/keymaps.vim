let mapleader = ","
nmap <f8> :TagbarToggle<cr>
nmap <tab> :NERDTreeToggle<cr>

" vim test
nmap tn :TestNearest<cr>
nmap tf :TestFile<cr>
nmap ts :TestSuite<cr>

nmap aa :call OpenFloatTerm()<cr>
nmap rr :!tmux send-keys -t rust.0 "cargo run" enter<cr>

nmap <leader>p :Files<cr>
nmap <leader>r :Rg<cr>
nmap <leader>w :Windows<cr>
nmap ww :call RipgrepFzf(expand("<cword>"), 0)<cr>

" Minimize block code
nnoremap <space> za

" Fast switch window
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

nmap <F2> :CocCommand document.renameCurrentWord<cr>

augroup filetype_python
    autocmd!
    autocmd FileType python iabbrev iff if:<left>
    autocmd FileType python iabbrev fof for i in range():<left><left>
    autocmd FileType python iabbrev whf while:<left>
    autocmd FileType python iabbrev imp import
augroup END

inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"

" Fast switch tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
