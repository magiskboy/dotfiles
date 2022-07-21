local tabline = require('tabline');

tabline.setup({
    enable = false,
    options = {
        section_separators = {'', ''},
        component_separators = {'', ''},
        show_devicons = false,
        show_filename_only = true
    }
});

local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
        { 
            'filename',
            path = 1
        },
        {
            'lsp_progress',
            display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' }},
            colors = {
              percentage  = colors.cyan,
              title  = colors.cyan,
              message  = colors.cyan,
              spinner = colors.cyan,
              lsp_client_name = colors.cyan,
              use = true,
            },
            separators = {
                component = ' ',
                progress = ' | ',
                message = { pre = '(', post = ')'},
                percentage = { pre = '', post = '%% ' },
                title = { pre = '', post = ': ' },
                lsp_client_name = { pre = '[', post = ']' },
                spinner = { pre = '', post = '' },
                message = { commenced = 'In Progress', completed = 'Completed' },
            },
            display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
            timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
            spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
        }
    },
    lualine_x = {'diagnostics'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {tabline.tabline_buffers},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {}
}
