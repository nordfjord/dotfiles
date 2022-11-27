local formatter = require('formatter')
local util = require('formatter.util')

local mix = require('formatter.defaults.mixformat')
local prettier = require('formatter.defaults.prettier')

formatter.setup({
  filetype = {
    lua = { require('formatter.filetypes.lua').stylua },
    javascript = { prettier('typescript') },
    typescript = { prettier('typescript') },
    markdown = { prettier('markdown') },
    yaml = { prettier('yaml') },
    typescriptreact = { prettier('typescript') },
    html = { prettier('html') },
    vue = { prettier('vue') },
    json = { prettier('json') },
    elixir = { mix },
  },
})

local map = vim.api.nvim_set_keymap

map('n', '<leader>f', ':Format<cr>', { noremap = true, silent = true })
