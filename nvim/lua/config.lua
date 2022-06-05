vim.cmd 'syntax enable'
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.hidden = true                               -- Required to keep multiple buffers open multiple buffers 
vim.opt.encoding='utf-8'                      -- The encoding displayed
vim.opt.fileencoding='utf-8'                  -- The encoding written to file
vim.opt.ruler = true              			            -- Show the cursor position all the time
-- vim.opt.cmdheight=2                         -- More space for displaying messages
vim.opt.mouse="a"                             -- Enable your mouse
vim.opt.splitbelow = true                          -- Horizontal splits will automatically be below
vim.opt.splitright = true                         -- Vertical splits will automatically be to the right
vim.opt.conceallevel=0                      -- So that I can see `` in markdown files
vim.opt.tabstop=2                           -- Insert 2 spaces for a tab
vim.opt.shiftwidth=2                        -- Change the number of space characters inserted for indentation
vim.opt.smarttab=true                            -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab=true                           -- Converts tabs to spaces
vim.opt.smartindent=true                         -- Makes indenting smart
vim.opt.autoindent=true                          -- Good auto indent
vim.opt.laststatus=0                        -- Always display the status line
vim.opt.number=true                              -- Line numbers
vim.opt.cursorline=true                          -- Enable highlighting of the current line
vim.opt.background='dark'                     -- tell vim what the background color looks like
vim.opt.showtabline = 0                       -- Always show tabs
vim.opt.updatetime=300                      -- Faster completion
vim.opt.timeoutlen=500                      -- By default timeoutlen is 1000 ms
vim.opt.formatoptions= vim.opt.formatoptions - 'cro'                  -- Stop newline continution of comments
vim.opt.clipboard="unnamedplus"               -- Copy paste between vim and everything else

vim.opt.showmode = true
vim.opt.showmatch = true

vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.iskeyword = vim.opt.iskeyword - '_'

