vim.g.mapleader = ','

local opts = {
    silent = true
}

vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})

vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('n', 'K', '5k', {})

vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', opts)

vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', ':Telescope lsp_implementations<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', opts)

vim.api.nvim_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

vim.api.nvim_set_keymap('n', 'U', '<cmd>redo<cr>', {})
vim.api.nvim_set_keymap('n', '\\', '<cmd>noh<cr>', {})

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {})
vim.api.nvim_set_keymap('', '<C-s>', '<cmd>write<cr>', {})
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>quit<cr>', {})

vim.api.nvim_set_keymap('n', '<leader>x', '<cmd>bdelete<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', opts)

