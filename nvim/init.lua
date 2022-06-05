local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local map = vim.api.nvim_set_keymap
map('n', '<SPACE>', '<Nop>', {noremap = true})
vim.g.mapleader = ' '

require('config')
require('plugins')


map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

vim.g['sneak#s_next'] = 1

vim.cmd [[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]
