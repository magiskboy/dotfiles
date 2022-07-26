vim.g.mapleader = ','

local opts = {
    silent = true
}

vim.api.nvim_set_keymap('n', '1', '^', {})   -- go to the start line
vim.api.nvim_set_keymap('n', '0', '$', {})   -- go to the end line
vim.api.nvim_set_keymap('n', '<F2>', '@:<cr>', {})   -- re-run last command

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})

vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('n', 'K', '5k', {})

vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<CR>', opts)
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', ':Telescope ls_references<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', ':Telescope lsp_implementations<CR>', opts)
vim.api.nvim_set_keymap('n', 'gt', ':Telescope lsp_type_definitions<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-i>', ':lua vim.lsp.buf.format()<cr>', opts)

vim.api.nvim_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>lua lazygit()<CR>', opts)

vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

vim.api.nvim_set_keymap('n', 'U', '<cmd>redo<cr>', {})
vim.api.nvim_set_keymap('n', '\\', '<cmd>noh<cr>', {})

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {})
vim.api.nvim_set_keymap('', '<C-s>', '<cmd>write<cr>', {})
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>quit<cr>', {})
