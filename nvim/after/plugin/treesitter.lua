require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  ignore_install = { 'typescript' }, -- I get better highlighting from the default plugins
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
