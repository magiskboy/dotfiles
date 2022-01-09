local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<leader>,', ':BufferPrevious<CR>', opts)
map('n', '<leader>.', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader><', ':BufferMovePrevious<CR>', opts)
map('n', '<leader>>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', ':BufferGoto 1<CR>', opts)
map('n', '<C-ader>2', ':BufferGoto 2<CR>', opts)
map('n', '<C-ader>3', ':BufferGoto 3<CR>', opts)
map('n', '<C-ader>4', ':BufferGoto 4<CR>', opts)
map('n', '<C-ader>5', ':BufferGoto 5<CR>', opts)
map('n', '<C-ader>6', ':BufferGoto 6<CR>', opts)
map('n', '<C-ader>7', ':BufferGoto 7<CR>', opts)
map('n', '<C-ader>8', ':BufferGoto 8<CR>', opts)
map('n', '<C-ader>9', ':BufferGoto 9<CR>', opts)
map('n', '<C-ader>0', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<leader>x', ':BufferClose<CR>', opts)
