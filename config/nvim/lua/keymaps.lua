vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '!', '^', {})   -- go to the start line
vim.api.nvim_set_keymap('n', '@', '$', {})   -- go to the end line

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})

vim.api.nvim_set_keymap('n', 'H', '5h', {})
vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('n', 'K', '5k', {})
vim.api.nvim_set_keymap('n', 'L', '4l', {})

vim.api.nvim_set_keymap('n', '<leader>1', '<Plug>AirlineSelectTab1', {})
vim.api.nvim_set_keymap('n', '<leader>2', '<Plug>AirlineSelectTab2', {})
vim.api.nvim_set_keymap('n', '<leader>3', '<Plug>AirlineSelectTab3', {})
vim.api.nvim_set_keymap('n', '<leader>4', '<Plug>AirlineSelectTab4', {})
vim.api.nvim_set_keymap('n', '<leader>5', '<Plug>AirlineSelectTab5', {})
vim.api.nvim_set_keymap('n', '<leader>6', '<Plug>AirlineSelectTab6', {})
vim.api.nvim_set_keymap('n', '<leader>7', '<Plug>AirlineSelectTab7', {})
vim.api.nvim_set_keymap('n', '<leader>8', '<Plug>AirlineSelectTab8', {})
vim.api.nvim_set_keymap('n', '<leader>9', '<Plug>AirlineSelectTab9', {})

vim.api.nvim_set_keymap('i', '<tab>', 'pumvisible() ? "<c-n>" : "<tab>"', { expr = true })

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

vim.api.nvim_set_keymap('n', 'F', ':Files<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<cr>', {})

vim.api.nvim_set_keymap('n', 'U', ':redo<cr>', {})
vim.api.nvim_set_keymap('n', 'nh', ':noh<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>h', ":call CocActionAsync('doHover')<cr>", {})

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {})
vim.api.nvim_set_keymap('', '<C-s>', ':write<cr>', {})
vim.api.nvim_set_keymap('n', '<C-q>', ':quit<cr>', {})

vim.api.nvim_set_keymap('n', '<C-c>', '<Plug>(coc-cursors-position)', { silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(coc-cursors-word)', { silent = true })
vim.api.nvim_set_keymap('x', '<C-d>', '<Plug>(coc-cursors-range)', { silent = true })

vim.api.nvim_set_keymap('n', '<C-e>', ':CocCommand explorer --toggle<cr>', {})
vim.api.nvim_set_keymap('n', '<C-r>', '<Plug>(coc-rename)', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':FloatermSend', {})
vim.api.nvim_set_keymap('n', 't', ':FloatermNew --wintype=float<cr>', {})
vim.api.nvim_set_keymap('n', 'T', ':FloatermNew --wintype=split<cr>', {})
vim.api.nvim_set_keymap('n', '<C-t>', ':FloatermNew --wintype=vsplit<cr>', {})
