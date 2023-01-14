local lsp_progress_config = require('plugins/lualine-lsp-progress-config');

require('lualine').setup {
  options = {
    -- icons_enabled = true,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    -- disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'branch', 'diff'},
    lualine_b = {{ 'filename', path = 1 }},
    lualine_c = {lsp_progress_config},
    lualine_x = {'diagnostics'},
    lualine_y = {'filetype'},
    lualine_z = {'%p%%', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'nvim-tree', 'fugitive', 'toggleterm', 'quickfix' }
}
