let mapleader = ","
nmap <f8> :TagbarToggle<cr>
nmap <tab> :NERDTreeToggle<cr>

" vim test
nmap tn :TestNearest<cr>
nmap tf :TestFile<cr>
nmap ts :TestSuite<cr>

nmap aa :call OpenFloatTerm()<cr>

nmap <leader>p :Files<cr>
nmap <leader>r :Rg<cr>
nmap <leader>w :Windows<cr>

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
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
