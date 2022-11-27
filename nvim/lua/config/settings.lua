local opt = vim.opt
opt.title = true
opt.smarttab = true
opt.hidden = true
opt.wrap = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.ruler = true
opt.mouse = 'a'
opt.splitbelow = true
opt.splitright = true
opt.conceallevel = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.laststatus = 2
opt.number = true
opt.cursorline = true
opt.background = 'dark'
opt.showtabline = 0
opt.updatetime = 300
opt.timeoutlen = 500
opt.formatoptions = opt.formatoptions - 'cro'
opt.clipboard = 'unnamedplus'

opt.showmode = true
opt.showmatch = true

opt.ignorecase = true
opt.splitright = true
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true

opt.iskeyword = opt.iskeyword - '_'

opt.signcolumn = 'yes'
opt.list = true
opt.listchars = { tab = '▸ ', trail = '·' }
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.updatetime = 300
