local api = require('nvim-tree.api')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  view = {
    side = "right"
  },
  renderer = {
    group_empty = true,
    icons = {
        webdev_colors = false,
    }
  },
  filters = {
    dotfiles = true,
  },
})
