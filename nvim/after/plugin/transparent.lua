vim.g.transparent_enabled = true

require("transparent").setup({
  extra_groups = {
      'Pmenu', 'PmenuExtra', 'NormalFloat', 'FloatBorder'
  }
})
