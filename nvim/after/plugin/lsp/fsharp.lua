local setup = require('lsp-setup')

vim.g['fsharp#fsautocomplete_command'] =
  { '/Users/nordfjord/.dotnet/tools/fsautocomplete', '--adaptive-lsp-server-enabled', '--project-graph-enabled' }
vim.g['fsharp#lsp_auto_setup'] = false
vim.g['fsharp#show_signature_on_cursor_move'] = false
vim.g['fsharp#lsp_recommended_colorscheme'] = false
vim.g['fsharp#lsp_codelens'] = true

setup(require('ionide'))

vim.cmd([[
  au BufReadPost *.fsproj set syntax=xml
]])
