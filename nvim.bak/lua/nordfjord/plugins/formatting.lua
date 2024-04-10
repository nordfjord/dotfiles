return {
  "mhartington/formatter.nvim",
  config = function()
    local formatter = require("formatter")
    local prettier = require("formatter.defaults.prettier")

    local filetypes = {
      javascript = { prettier },
      typescript = { prettier },
      markdown = { prettier },
      yaml = { prettier },
      typescriptreact = { prettier },
      html = { prettier },
      vue = { prettier },
      json = { prettier },
      svelte = { prettier },
      css = { prettier },
    }

    formatter.setup({
      filetype = filetypes
    })

    -- if buffer filetype is configured use formatter otherwise LSP
    local function format()
      if filetypes[vim.bo.filetype] ~= nil then
        vim.cmd("Format")
      else
        vim.lsp.buf.format()
      end
    end

    vim.keymap.set("n", "<leader>f", format, { noremap = true, silent = true })
  end
}
