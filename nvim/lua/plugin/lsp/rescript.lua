local lsp = require('lspconfig')
local setup = require('plugin.lsp.setup')


local rescript_server_path = vim.fn.stdpath('data')..'/site/pack/packer/start/vim-rescript/server/out/server.js'

setup(lsp.rescriptls, {
  cmd = {'node', rescript_server_path, '--stdio'}
})

