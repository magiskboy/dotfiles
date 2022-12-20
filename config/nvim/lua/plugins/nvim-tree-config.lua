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
  open_on_tab         = false,
  hijack_cursor       = true,
  renderer = {
      icons = {
          show = {
            folder = true,
            file = true,
            folder_arrow = false,
            git = true
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
    width = '100%',
    hide_root_folder = true,
    signcolumn = "no",
    side = 'right',
    mappings = {
      custom_only = false,
      list = {
        { key = {"l", "<2-LeftMouse>"},      cb = tree_cb("edit") },
        { key = "h",                         cb = tree_cb("close_node") },
        { key = "dd",                        cb = tree_cb("cut") },
        { key = "yy",                        cb = tree_cb("copy") },
        { key = "x",                         cb = tree_cb("remove") },
        { key = "?",                         cb = tree_cb("toggle_help") },
        { key = "t",                         cb = tree_cb("tabnew") },
        { key = "<C-e>",                     cb = nil, action = "" }
      }
    },
    float = {
        enable = true
    }
  },
}


vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>NvimTreeToggle<cr>', {})
