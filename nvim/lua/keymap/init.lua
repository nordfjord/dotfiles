vim.g.mapleader = ' '

vim.keymap.set('n', '<SPACE>', '<Nop>', { noremap = true })

-- Keep visual selection after move
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- open the file under the cursor
vim.keymap.set('n', 'gf', ':edit <cfile><cr>', { noremap = true })
-- source current lua file
vim.keymap.set('n', '<leader>lf', ':luafile %<cr>', { noremap = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

require('keymap.splits')
