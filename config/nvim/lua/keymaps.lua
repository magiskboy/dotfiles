vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '1', '^', {})   -- go to the start line
vim.api.nvim_set_keymap('n', '0', '$', {})   -- go to the end line
vim.api.nvim_set_keymap('n', '<F2>', '@:<cr>', {})   -- re-run last command

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})

vim.api.nvim_set_keymap('n', 'H', '5h', {})
vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('n', 'K', '5k', {})
vim.api.nvim_set_keymap('n', 'L', '4l', {})

vim.api.nvim_set_keymap('n', '<leader>1', '1gt', {})
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', {})
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', {})
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', {})
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', {})
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', {})
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', {})
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', {})
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', {})

vim.api.nvim_set_keymap('i', '<tab>', 'pumvisible() ? "<c-n>" : "<tab>"', { expr = true })

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>Gitsigns blame_line<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>Telescope live_grep<cr>', {})

vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>LazyGit<cr>', {})

vim.api.nvim_set_keymap('n', 'U', '<cmd>redo<cr>', {})
vim.api.nvim_set_keymap('n', '\\', '<cmd>noh<cr>', {})

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {})
vim.api.nvim_set_keymap('', '<C-s>', '<cmd>write<cr>', {})
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>quit<cr>', {})

vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>NvimTreeToggle<cr>', {})

vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>FloatermSend', {})
vim.api.nvim_set_keymap('n', 't', '<cmd>FloatermNew --wintype=float<cr>', {})
vim.api.nvim_set_keymap('n', 'T', '<cmd>FloatermNew --wintype=split<cr>', {})
vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>FloatermNew --wintype=vsplit<cr>', {})
