vim.cmd([[
filetype plugin indent on
set termguicolors
set t_Co=256
syntax on
syntime on
]])

local onedark = require('onedark')
onedark.setup({
    style = "deep"
})
onedark.load()


vim.o.shell = "/bin/zsh"
vim.o.wrap = true
vim.o.showcmd = false
vim.o.autoindent = true
vim.o.cursorline = true
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
vim.o.undodir = "/tmp/nvim"
vim.o.wildmenu = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.laststatus = 2
vim.o.path = vim.o.path .. "**"
vim.o.updatetime = 100

vim.g.python3_host_prog = vim.api.nvim_eval("expand('/usr/bin/python3')")
vim.g.python_host_prog = vim.api.nvim_eval("expand('/usr/bin/python2')")
vim.g.indentLine_enabled = 1
vim.g.indentLine_char = ''
vim.g.indentLine_color_term = 239
vim.o.background = 'dark'

vim.cmd([[
autocmd FileType javascript,typescript,typescriptreact,javascriptreact,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2
]])

vim.diagnostic.config({
  virtual_text = false
})

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
    callback = function(args) 
        vim.diagnostic.open_float(nil, {focus=false})
    end
})
