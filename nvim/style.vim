hi GitGutterAdd cterm=BOLD ctermbg=NONE ctermfg=green gui=BOLD guibg=NONE guifg=lightgreen
hi GitGutterDelete cterm=BOLD ctermbg=NONE ctermfg=red gui=BOLD guibg=NONE guifg=red
hi GitGutterChange cterm=BOLD ctermbg=NONE ctermfg=lightblue gui=BOLD guibg=NONE guifg=lightblue
hi ALEWarning cterm=BOLD ctermbg=NONE ctermfg=NONE gui=BOLD guibg=NONE guifg=NONE
hi ALEErrorSign cterm=BOLD ctermbg=NONE ctermfg=red gui=BOLD guibg=NONE guifg=red
hi ALEWarningSign cterm=BOLD ctermbg=NONE ctermfg=white gui=BOLD guibg=NONE guifg=yellow
hi EndOfBuffer cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=bg
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=234 gui=NONE guibg=NONE guifg=grey
hi LineNr cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
hi Pmenu guibg=#444934 guifg=0
hi SignColumn guibg=NONE
hi ColorColumn guibg=#30353b
hi Comment gui=italic
hi MyGroup gui=bold
hi MatchParen guibg=NONE guifg=orange
hi RedundantWhitespace cterm=NONE ctermbg=white ctermfg=NONE gui=NONE guibg=white guifg=NONE
match RedundantWhitespace /\s\+$\| \+\zs\t/
match MyGroup /./
