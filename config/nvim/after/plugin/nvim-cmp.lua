local cmp = require'cmp'

cmp.setup({
  window = {
    documentation = {
      border = 'single',
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
    },
    completion = {
      scrollbar = true,
      border = 'single',
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
      completeopt = 'menu,menuone,noinsert',
      keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
    },
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.ContextReason.None })),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.ContextReason.None })),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' }
  }),
})

cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' }
    }
});
