local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>tt', '<cmd>TestNearest<cr>', opts)
map('n', '<leader>tf', '<cmd>TestFile<CR>', opts)
map('n', '<leader>ts', '<cmd>TestSuite<CR>', opts)
map('n', '<leader>tl', '<cmd>TestLast<CR>', opts)
map('n', '<leader>to', '<cmd>TestVisit<CR>', opts)
