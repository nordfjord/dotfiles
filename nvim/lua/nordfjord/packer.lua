vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = { { "nvim-lua/plenary.nvim" } }
  })

  use({ "rose-pine/neovim", as = "rose-pine" })

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/playground")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("nordfjord/vim-test")
  use("theprimeagen/harpoon")
  use("theprimeagen/vim-be-good")

  use("adelarsq/neofsharp.vim")

  use("github/copilot.vim")

  use("rescript-lang/vim-rescript")

  use("mhartington/formatter.nvim")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-buffer" },       -- Optional
      { "hrsh7th/cmp-path" },         -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" },     -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },             -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    }
  })
end)
