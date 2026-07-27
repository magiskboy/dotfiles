require("mason").setup({})
require("mason-lspconfig").setup({
    automatic_installation = true,
})

local util = require'lspconfig'.util
local lsp = require('lspconfig');

-- LSP settings (for overriding per client)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' });
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' });
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, border = 'single' });

-- setup language server
lsp.ruff.setup({})
lsp.pyright.setup({
    filetypes = { 'python', 'cython' }
})

lsp.ts_ls.setup({
    root_dir = util.root_pattern("package.json"),
})
-- lsp.eslint.setup({
--   on_attach = function(_, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
-- })

lsp.yamlls.setup{}

lsp.html.setup{}

lsp.clangd.setup{}

lsp.gopls.setup{}

lsp.helm_ls.setup{
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}

lsp.terraformls.setup{}

lsp.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}


lsp.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}
