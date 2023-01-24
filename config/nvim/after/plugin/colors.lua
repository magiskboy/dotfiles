function MyColor(color)
    vim.cmd[[
        hi lualine_a_diff_modified_normal   guifg=#0043b8
        hi lualine_a_diff_modified_insert   guifg=#0043b8
        hi lualine_a_diff_modified_visual   guifg=#0043b8
        hi lualine_a_diff_modified_command  guifg=#0043b8
        hi lualine_a_diff_modified_terminal guifg=#0043b8
        hi lualine_a_diff_modified_replace  guifg=#0043b8

        hi lualine_a_diff_added_normal      guifg=#2e4233
        hi lualine_a_diff_added_insert      guifg=#2e4233
        hi lualine_a_diff_added_visual      guifg=#039c4d
        hi lualine_a_diff_added_command     guifg=#039c4d
        hi lualine_a_diff_added_terminal    guifg=#039c4d
        hi lualine_a_diff_added_replace     guifg=#039c4d
    ]]
end
MyColor()
