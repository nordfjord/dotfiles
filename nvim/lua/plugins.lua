vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'numToStr/Comment.nvim',
        config = function () require('plugin.comment') end }
  use 'tpope/vim-fugitive'
  use  'tpope/vim-surround'
  use 'airblade/vim-rooter'
  use { 'navarasu/onedark.nvim',
        config = function () require('plugin.onedark') end }
  use 'justinmk/vim-sneak'
  use 'ryanoasis/vim-devicons'
  use { 'vim-test/vim-test',
        config = function () require('plugin.test') end }

  use {'neovim/nvim-lspconfig',
       config = function() require('plugin.lsp') end }



  use { 'dcampos/nvim-snippy',
        config = function() require('plugin.snippy') end }
  -- Completion backend
  use { 'hrsh7th/nvim-cmp',
  requires = {
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'dcampos/cmp-snippy'},
  }, config = function() require('plugin.cmp') end}

  use { 
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
	    {'nvim-telescope/telescope-file-browser.nvim'},
    },
    config = function() require('plugin.telescope') end 
  }

  use 'ionide/Ionide-vim'
  use 'rescript-lang/vim-rescript'
  use 'elixir-editors/vim-elixir'
  use 'nkrkv/nvim-treesitter-rescript'
  use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugin.treesitter') end }

  use {
    'mhartington/formatter.nvim',
    config = function() require('plugin.formatter') end
  }

  use {
    'preservim/nerdtree',
    config = function() require('plugin.nerdtree') end
  }

end)


