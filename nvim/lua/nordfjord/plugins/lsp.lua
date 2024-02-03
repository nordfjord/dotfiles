-- Language servers
return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
      "hrsh7th/cmp-nvim-lsp",
      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
      -- Status updates for LSP
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    },
    config = function(_, _)
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("neodev").setup({})
      local remap = require("nordfjord.lsp-remap")

      -- Enable virtual text
      vim.diagnostic.config({ virtual_text = true })

      -- Install and configure LSP servers
      local server_settings = {
        lua_ls = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                quote_style = "double",
              }
            },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local mason_lspconfig = require "mason-lspconfig"
      mason_lspconfig.setup { ensure_installed = vim.tbl_keys(server_settings) }
      mason_lspconfig.setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = remap.attach,
            settings = server_settings[server_name],
            filetypes = (server_settings[server_name] or {}).filetypes,
          }
        end,
      }

      require("lspconfig").ocamllsp.setup {
        capabilities = capabilities,
        on_attach = remap.attach,
      }
    end,
  },
}
