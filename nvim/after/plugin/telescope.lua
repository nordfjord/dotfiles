local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-h>'] = actions.which_key,
      },
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
})


require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')


local map = vim.api.nvim_set_keymap

map('n', '<leader>pf', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
map('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { noremap = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

map('n', '<leader>of', '<cmd>Telescope file_browser<cr>', { noremap = true })
