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

local function construct_winbar()
  -- Right aligned
  local winbar = { '%=', '%#WinBarGroup#' }
  local bufnr = vim.api.nvim_get_current_buf()
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

  return construct_winbar()
end

vim.api.nvim_create_autocmd({
  'BufWinEnter',
  'BufLeave',
  'BufDelete',
  'BufEnter',
}, {
  group = vim.api.nvim_create_augroup('WinBarGroup', {}),
  callback = function()
    vim.opt_local.winbar = render_winbar()
  end,
})
