local M = {}

local augroup_codelens = vim.api.nvim_create_augroup("custom-lsp-codelens", { clear = true })
local attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
  vim.keymap.set("n", "gr", builtin.lsp_references, opts)
  vim.keymap.set("n", "gI", builtin.lsp_implementations, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  vim.api.nvim_clear_autocmds({ group = augroup_codelens, buffer = bufnr })

  if client.server_capabilities.codeLensProvider then
    vim.keymap.set("n", "<leader>ct", function() vim.lsp.codelens.refresh() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.codelens.run() end, opts)

    vim.api.nvim_create_autocmd(
      { "BufEnter", "BufWritePost", "InsertLeave" },
      {
        callback = function() vim.lsp.codelens.refresh() end,
        group = augroup_codelens,
        buffer = bufnr
      })
  end
end


M.attach = attach

return M
