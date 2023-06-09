local cmp = require'cmp'

cmp.setup({
  window = {
    documentation = {
      border = 'single',
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
      scrollbar = true,
    },
    completion = {
      scrollbar = true,
      border = 'single',
      completeopt = 'menu,menuone,noinsert',
    },
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.ContextReason.None })),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.ContextReason.None })),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping.scroll_docs(1),
    ['<C-k>'] = cmp.mapping.scroll_docs(-1),
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
