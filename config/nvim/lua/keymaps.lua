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

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<cr>', {})

vim.api.nvim_set_keymap('n', '<C-g>', ':LazyGit<cr>', {})

vim.api.nvim_set_keymap('n', 'U', ':redo<cr>', {})
vim.api.nvim_set_keymap('n', '\\', ':noh<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>h', ":call CocActionAsync('doHover')<cr>", {})

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {})
vim.api.nvim_set_keymap('', '<C-s>', ':write<cr>', {})
vim.api.nvim_set_keymap('n', '<C-q>', ':quit<cr>', {})

vim.api.nvim_set_keymap('n', '<C-c>', '<Plug>(coc-cursors-position)', { silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(coc-cursors-word)', { silent = true })
vim.api.nvim_set_keymap('x', '<C-d>', '<Plug>(coc-cursors-range)', { silent = true })

vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<C-r>', '<Plug>(coc-rename)', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':FloatermSend', {})
vim.api.nvim_set_keymap('n', 't', ':FloatermNew --wintype=float<cr>', {})
vim.api.nvim_set_keymap('n', 'T', ':FloatermNew --wintype=split<cr>', {})
vim.api.nvim_set_keymap('n', '<C-t>', ':FloatermNew --wintype=vsplit<cr>', {})
