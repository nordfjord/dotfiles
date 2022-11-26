local map = vim.api.nvim_set_keymap
map('n', '<SPACE>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- Keep visual selection after move
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

require('keymap.splits')
