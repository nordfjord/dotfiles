-- Recommended: this makes the hover windows unfocusable.
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { focusable = false })

-- Optional: this changes the prefix of diagnostic texts.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = '!',
  },
})


require('plugin.lsp.fsharp')
require('plugin.lsp.lua')
require('plugin.lsp.ocaml')
require('plugin.lsp.python')
require('plugin.lsp.rescript')
require('plugin.lsp.typescript')
