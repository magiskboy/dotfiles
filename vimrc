filetype plugin on
syntax on
set number numberwidth=5 norelativenumber
set tabstop=4 shiftwidth=4 expandtab
set undofile noswapfile nobackup
set undodir=/tmp
set autoindent
set mouse=a
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
colorscheme desert
hi SignColumn guibg=NONE
hi MyGroup gui=bold
hi RedundantWhitespace cterm=NONE ctermbg=white ctermfg=NONE gui=NONE guibg=white guifg=NONE
match RedundantWhitespace /\s\+$\| \+\zs\t/
match MyGroup /./
let mapleader = ","
