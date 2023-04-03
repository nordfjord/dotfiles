vim.g.mapleader = " "
vim.keymap.set('n', '<SPACE>', '<Nop>', { noremap = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Keep visual selection after move
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- Moving between splits
vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true })
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true })
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true })
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true })

-- Sizing splits
vim.keymap.set("n", "<leader>w=", "<c-w>=", { noremap = true })
vim.keymap.set("n", "<leader>ws", "<c-w>|", { noremap = true })

-- Creating splits
vim.keymap.set("n", "<leader>wv", "<c-w>v", { noremap = true })
vim.keymap.set("n", "<leader>wV", "<c-w>v<c-w>w", { noremap = true })
vim.keymap.set("n", "<leader>ws", "<c-w>s", { noremap = true })
vim.keymap.set("n", "<leader>wS", "<c-w>s<c-w>w", { noremap = true })
