local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tr", builtin.resume, {})

local function grep_cword()
  local word = vim.fn.expand("<cword>")
  return builtin.grep_string({ search = word })
end

vim.keymap.set("n", "<leader>*", grep_cword, {})

local function grep_visual_selection()
  -- Yank current visual selection into the 'v' register
  --
  -- Note that this makes no effort to preserve this register
  vim.cmd('noau normal! "vy"')

  return builtin.grep_string({ search = vim.fn.getreg("v") })
end

vim.keymap.set("v", "<leader>*", grep_visual_selection, {})
