return {

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Core sources
      "hrsh7th/cmp-nvim-lsp",
      -- Snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "windwp/nvim-autopairs"
    },
    config = function(_, _)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup {}

      require("nvim-autopairs").setup()
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        preselect = cmp.PreselectMode.Item,
        completion = {
          completeopt = "menu,menuone,noinsert"
        },
        window = {
          documentation = cmp.config.window.bordered({ max_width = 80 }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
}
