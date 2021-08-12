vim.cmd([[
filetype plugin indent on
set termguicolors
set t_Co=256
colorscheme gruvbox
syntax on
syntime on
]])

vim.o.shell = "/bin/bash"
vim.o.wrap = true
vim.o.showcmd = false 
vim.o.autoindent = true
vim.o.cursorline = false
vim.o.ignorecase = false
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.numberwidth = 5
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.undofile = true
vim.swapfile = true
vim.backup = true
vim.o.undodir = "/tmp"
vim.o.wildmenu = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.laststatus = 2

vim.g.python3_host_prog = vim.api.nvim_eval("expand('~/.pyenv/shims/python')")
vim.g.python_host_prog = vim.api.nvim_eval("expand('/usr/bin/python2')")
vim.g.indentLine_enabled = 1
vim.g.indentLine_char = '│'
vim.g.indentLine_color_term = 239
vim.g.AutoPairsShortcutToggle = ""
vim.g.airline_skip_empty_sections = 1
vim.g.airline_highlighting_cache = 1
vim.g.airline_extensions = { 'branch', 'hunks', 'coc', 'tabline' }
vim.g.airline_left_sep = ''
vim.g.airline_right_sep = ''
vim.g.fzf_layout = { down = '~100%' }
vim.g.coc_global_extensions = {
    'coc-json',
    'coc-tsserver',
    'coc-rust-analyzer',
    'coc-clangd',
    'coc-go',
    'coc-python',
    'coc-jedi',
    'coc-eslint',
    'coc-prettier',
    'coc-explorer',
    'coc-css',
    'coc-html'
}
vim.api.nvim_set_var("airline#extensions#tabline#formatter", 'default')
vim.api.nvim_set_var("airline#extensions#tabline#tab_nr_type", "1")
vim.api.nvim_set_var("airline#extensions#tabline#show_tab_nr", "1")
vim.api.nvim_set_var("airline#extensions#tabline#left_sep", '')
vim.api.nvim_set_var("airline#extensions#tabline#right_sep", '')
vim.api.nvim_set_var("airline#extensions#tabline#left_alt_sep", ' ')
vim.api.nvim_set_var("airline#extensions#tabline#right_alt_sep", ' ')
vim.api.nvim_set_var('airline#extensions#default#layout', {{'a', 'b', 'c'}, {'x', 'y', 'z', 'warning', 'error'}})

vim.cmd([[
hi GitGutterAdd ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermbg=NONE guibg=NONE
hi GitGutterChange ctermbg=NONE guibg=NONE 
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi SignColumn guibg=NONE
hi ColorColumn guibg=#30353b
]])

vim.cmd([[
autocmd FileType json let g:indentLine_setConceal = 0
autocmd BufWritePost * GitGutter
autocmd FileType javascript,typescript,jsx,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
]])

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "html",
        "typescript",
        "javascript",
        "tsx",
        "css",
        "scss",
        "python",
        "rust",
        "go",
        "dockerfile",
        "json",
        "yaml",
        "lua",
        "bash",
        "c",
        "cpp",
        "cmake",
        "toml",
        "java",
    },

    highlight = {
        enable = true,
    }
}
