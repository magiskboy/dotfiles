vim.api.nvim_exec(
    [[
        function! DisableST()
          return ""
        endfunction
        au BufEnter NvimTree setlocal statusline=%!DisableST()
    ]],
    false
)

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
  open_on_tab         = true,
  hijack_cursor       = true,
  renderer = {
      icons = {
          show = {
            folder = true,
            file = true,
            folder_arrow = false,
            git = false
          }
      },
      highlight_git = true
  },
  actions = {
      open_file = {
          resize_window = true
      }
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = true,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {
        { key = {"l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = "h",                         cb = tree_cb("close_node") },
        { key = "dd",                        cb = tree_cb("cut") },
        { key = "yy",                        cb = tree_cb("copy") },
        { key = "x",                         cb = tree_cb("remove") },
        { key = "?",                         cb = tree_cb("toggle_help") },
        { key = "t",                         cb = tree_cb("tabnew") }
      }
    },
  },
}


vim.api.nvim_set_keymap('n', '<tab>', '<cmd>NvimTreeToggle<cr>', {})
