local map = vim.api.nvim_set_keymap

local opts = { noremap = true }
map('n', '<leader>op', ':Neotree filesystem toggle<cr>', opts)
map('n', '<leader>oP', ':Neotree filesystem reveal<cr>', opts)
map('n', '<leader>og', ':Neotree git_status<cr>', opts)

require('neo-tree').setup({
  source_selector = {
    winbar = true,
    statusline = false,
  },
})
