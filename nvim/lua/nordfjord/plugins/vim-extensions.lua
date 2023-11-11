return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
    end
  },
  { "tpope/vim-surround" }
}
