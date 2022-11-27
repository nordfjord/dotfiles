vim.cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('justinmk/vim-sneak')

  use('kyazdani42/nvim-web-devicons')
  -- use('chriskempson/base16-vim')
  -- use({
  --  'nordfjord/onehalf',
  --  rtp = 'vim/',
  --  config = function()
  --    require('config.colorscheme')
  --  end,
  -- })
  use({
    'nordfjord/vim-test',
    config = function()
      require('plugin.test')
    end,
  })

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('plugin.lsp')
    end,
  })

  use({
    'dcampos/nvim-snippy',
    config = function()
      require('plugin.snippy')
    end,
  })

  -- Completion backend
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'dcampos/cmp-snippy' },
      { 'onsails/lspkind-nvim' },
    },
    config = function()
      require('plugin.cmp')
    end,
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = function()
      require('plugin.telescope')
    end,
  })

  use('ionide/Ionide-vim')

  use({
    'mhartington/formatter.nvim',
    config = function()
      require('plugin.formatter')
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugin.treesitter')
    end,
  })

  use({
    'preservim/nerdtree',
    config = function()
      require('plugin.nerdtree')
    end,
  })
end)
