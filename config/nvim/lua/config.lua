vim.cmd([[
filetype plugin indent on
set termguicolors
set t_Co=256
colorscheme gruvbox-material
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
vim.g.floaterm_autoclose = 2

vim.cmd([[
hi RedSign guibg=NONE
hi AquaSign guibg=NONE
hi YellowSign guibg=NONE
hi BlueSign guibg=NONE
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
]])
