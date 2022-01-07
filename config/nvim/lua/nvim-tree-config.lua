vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 0
}

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
  auto_close          = true,
  open_on_tab         = true,
  hijack_cursor       = true,
  view = {
    width = 40,
    height = 30,
    hide_root_folder = true,
    side = 'right',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = {"l", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = "h",                         cb = tree_cb("close_node") },
        { key = "dd",                        cb = tree_cb("cut") },
        { key = "yy",                        cb = tree_cb("copy") },
      }
    },
  },
}
