vim.g['NERDTreeShowHidden'] = 1
vim.g['NERDTreeMinimalUI'] = 1
vim.g['NERDTreeIgnore'] = {}
vim.g['NERDTreeStatusline'] = ''

local map = vim.api.nvim_set_keymap

local opts = { noremap = true }
map('n', '<leader>op', ':NERDTree<cr>', opts)
map('n', '<leader>oP', ':NERDTreeFind<cr>', opts)
