vim.opt.termguicolors = true
vim.cmd([[
  colorscheme dracula_pro
  highlight Comment guifg=#7971A9 gui=italic
  highlight LspDiagnosticsDefaultError ctermbg=Red ctermfg=White
  highlight LspDiagnosticsDefaultWarning ctermbg=Yellow ctermfg=Black
  highlight LspDiagnosticsDefaultInformation ctermbg=LightBlue ctermfg=Black
  highlight LspDiagnosticsDefaultHint ctermbg=Green ctermfg=White
  highlight default link LspCodeLens Comment
]])
