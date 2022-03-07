require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
}

vim.cmd([[
hi IndentBlankLineContextChar guifg=gray
]])
