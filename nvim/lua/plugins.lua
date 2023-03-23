vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('justinmk/vim-sneak')
  use('kyazdani42/nvim-web-devicons')
  use('nordfjord/vim-test')
  use('neovim/nvim-lspconfig')

  use('dcampos/nvim-snippy')

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
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
    },
  })

  use('ionide/Ionide-vim')

  use('mhartington/formatter.nvim')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  use('rescript-lang/vim-rescript')

  -- vim.g['neo_tree_remove_legacy_commands'] = true
  -- use({
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = 'v2.x',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  --     'MunifTanjim/nui.nvim',
  --   },
  --   config = function()
  --     require('plugin.neotree')
  --   end,
  -- })
end)
