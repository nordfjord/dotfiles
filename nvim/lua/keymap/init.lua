local map = vim.api.nvim_set_keymap
map('n', '<SPACE>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- Keep visual selection after move
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

-- open the file under the cursor
map('n', 'gf', ':edit <cfile><cr>', {noremap = true})
-- source current lua file
map('n', '<leader>lf', ':luafile %<cr>', { noremap = true })

require('keymap.splits')

