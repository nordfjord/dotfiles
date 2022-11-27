local buffer = {
  path = function(bufnr)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':~:.:h') .. '/'
  end,
  abs_path = function(bufnr)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':h') .. '/'
  end,
  tail = function(bufnr)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':t')
  end,
  ext = function(bufnr)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':e')
  end,
}

local function parse_buf_name(abs, path, name)
  return path .. name
end

local function get_icon(name, extension)
  return require('nvim-web-devicons').get_icon(name, extension, {})
end

local blacklist = {
  'help',
  'neo-tree',
  'fugitive',
  'gitcommit',
  'Trouble',
  'dashboard',
  'toggleterm',
  'git',
  'qf',
  'packer',
  '',
}

local function construct_winbar()
  -- Right aligned
  local winbar = { '%=', '%#WinBarGroup#' }
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.tbl_contains(blacklist, vim.bo.filetype) then
    return nil
  end
  local path = buffer.path(bufnr)
  local basename = buffer.tail(bufnr)
  local ext = buffer.ext(bufnr)

  local filename = path .. basename
  local icon, color = get_icon(basename, ext)
  local bufinfo = vim.fn.getbufinfo(bufnr)[1]

  if icon then
    table.insert(winbar, ' ' .. icon .. ' ')
  end
  table.insert(winbar, filename .. ' %#Normal#%=')
  return table.concat(winbar)
end

local function render_winbar()
  -- Ignore floating windows
  if vim.api.nvim_win_get_config(0).relative ~= '' then
    return nil
  end

  local winbar = construct_winbar()
  if winbar ~= nil then
    vim.opt_local.winbar = winbar
  end
end

vim.api.nvim_create_autocmd({
  'BufWinEnter',
  'BufLeave',
  'BufDelete',
  'BufEnter',
}, {
  group = vim.api.nvim_create_augroup('WinBarGroup', {}),
  callback = function()
    render_winbar()
  end,
})
