filetype off

set rtp+=~/.config/nvim/bundle/vim-plug

call plug#begin('~/.vim/bundle')

" File explore
Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Indent guild line
Plug 'Yggdroot/indentLine'

" Vim modern status line
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" Vim tag bar
Plug 'majutsushi/tagbar'

" Asynchronous syntax checker
Plug 'w0rp/ale'

" Solid pack language syntax highlight
" Plug 'sheerun/vim-polyglot'

" Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'

Plug 'rust-lang/rust.vim'

" Code completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Auto fill closer characters
Plug 'jiangmiao/auto-pairs'

" File search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Helper for UNIX
Plug 'tpope/vim-eunuch'

" Test vim
Plug 'janko/vim-test'

Plug 'tpope/vim-commentary'

call plug#end()

filetype on
