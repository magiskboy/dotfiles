vim.cmd([[
filetype plugin indent on
set termguicolors
set t_Co=256
colorscheme solarized8_flat
syntax on
syntime on
au VimLeave * set guicursor=a:ver100
]])

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
vim.o.updatetime = 250


vim.g.did_load_filetypes = 1
vim.g.python3_host_prog = vim.api.nvim_eval("expand('/usr/bin/python3')")
vim.g.python_host_prog = vim.api.nvim_eval("expand('/usr/bin/python2')")
vim.g.indentLine_enabled = 1
vim.g.indentLine_char = ''
vim.g.indentLine_color_term = 239
vim.g.AutoPairsShortcutToggle = ""
vim.g.floaterm_autoclose = 2
vim.o.background = 'dark'
vim.g.vscode_style = "dark"


vim.cmd([[
hi RedSign guibg=NONE
hi AquaSign guibg=NONE
hi YellowSign guibg=NONE
hi BlueSign guibg=NONE
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi NonText cterm=NONE ctermfg=242 gui=NONE guifg=#4c5b63

autocmd FileType javascript,typescript,typescriptreact,javascriptreact,xml,yaml,json,html,css,sass,scss,less,jinja,htmldjango setlocal ts=2 sts=2 sw=2

command! JsonBeauty %!jq .
command! JsonMinify %!jq -c .
command! GoRun !go run %
command! Replace lua require("spectre").open()<cr>
]])

vim.diagnostic.config({
  virtual_text = false
})

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
    callback = function(args) 
        vim.diagnostic.open_float(nil, {focus=false})
    end
})

vim.api.nvim_create_user_command("Python", function (args)
    python()
end, {})

vim.api.nvim_create_user_command("Node", function (args)
    node()
end, {})

vim.api.nvim_create_user_command("Htop", function (args)
    htop()
end, {})

