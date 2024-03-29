return {
  "mfussenegger/nvim-lint",
  dependencies = {
    -- Linter Manager (used to install eslint_d, etc.)
    "williamboman/mason.nvim",
  },
  config = function(_, _)
    local lint = require("lint")
    lint.linters_by_ft = {
      typescript = { "eslint_d" },
      javascript = { "eslint_d" },
    }

    table.insert(lint.linters.eslint_d.args, "--no-warn-ignored")

    -- Lint buffers on write
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("LintOnWrite", {}),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
