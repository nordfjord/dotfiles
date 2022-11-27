vim.opt.termguicolors = true

vim.cmd([[
  colorscheme dracula_pro
  highlight DraculaComment guifg=#7971A9 gui=italic
  highlight default link LspCodeLens DraculaComment
  highlight VertSplit guifg=#454158
]])
