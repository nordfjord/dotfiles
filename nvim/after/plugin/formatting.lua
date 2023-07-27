local formatter = require("formatter")
local prettier = require("formatter.defaults.prettier")

local filetypes = {
  javascript = { prettier("typescript") },
  typescript = { prettier("typescript") },
  markdown = { prettier("markdown") },
  yaml = { prettier("yaml") },
  typescriptreact = { prettier("typescript") },
  html = { prettier("html") },
  vue = { prettier("vue") },
  json = { prettier("json") },
  svelte = { prettier("svelte") },
}

formatter.setup({
  filetype = filetypes
})

-- if buffer filetype is configured use formatter otherwise LSP
local function format()
  if filetypes[vim.bo.filetype] ~= nil then
    vim.cmd("Format")
  else
    vim.lsp.buf.formatting()
  end
end

vim.keymap.set("n", "<leader>f", format, { noremap = true, silent = true })
