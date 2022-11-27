require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'ocaml', 'markdown', 'python', 'toml', 'yaml', 'vim', 'fish' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
