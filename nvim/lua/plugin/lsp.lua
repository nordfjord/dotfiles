local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

map('n', '<leader>d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- keymaps after LSP attaches
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local map = vim.api.nvim_buf_set_keymap
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  map(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  map(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp')
  .default_capabilities(vim.lsp.protocol.make_client_capabilities())

local setup = function(server, conf)
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
  }
  if conf ~= nil then
    for k,v in pairs(conf) do
      config[k] = v
    end
  end
  server.setup(config)
end

local lsp = require('lspconfig')

setup(lsp.tsserver)
setup(lsp.ocamllsp)
vim.g['fsharp#fsautocomplete_command'] = { "/Users/nordfjord/.dotnet/tools/fsautocomplete", "--adaptive-lsp-server-enabled", "--project-graph-enabled" }
vim.g['fsharp#lsp_auto_setup'] = false
vim.g['fsharp#show_signature_on_cursor_move'] = true 
vim.cmd [[
  if has('nvim') && exists('*nvim_open_win')
    set updatetime=1000
    augroup FSharpShowTooltip
      autocmd!
      autocmd CursorHold *.fs,*.fsi,*.fsx call fsharp#showTooltip()
    augroup END
  endif
]]
setup(require('ionide'))

-- Recommended: this makes the hover windows unfocusable.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

-- Optional: this changes the prefix of diagnostic texts.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = {
     prefix = '!',
   },
 }
)
