local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = { 
      i = {
--        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
      n = {
        -- ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      }
    },
  }
}

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'file_browser'

local map = vim.api.nvim_set_keymap

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
map('n', '<c-p>', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})

map(
  'n',
  '<leader>pf',
  "<cmd>Telescope file_browser<cr>",
  {noremap = true}
)
