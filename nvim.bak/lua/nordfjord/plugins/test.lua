return {
  "nordfjord/vim-test",
  config = function()
    vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<cr>")
    vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>")
    vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<CR>")
    vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<CR>")
    vim.keymap.set("n", "<leader>to", "<cmd>TestVisit<CR>")
  end
}
