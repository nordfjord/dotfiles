return {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            local disable_types = { sql = true }
            if disable_types[vim.bo[bufnr].filetype] then
                return
            end
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_lsp = { c = true, cpp = true, javascript = true, typescript = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_lsp[vim.bo[bufnr].filetype],
            }
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- isjavascript  found.
            javascript = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            elixir = { "mix" },
            css = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            svelte = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            sql = { "sleek" },
            terraform = { "terraform_fmt" },
        },
    },
}
