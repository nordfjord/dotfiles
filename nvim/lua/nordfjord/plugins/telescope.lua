return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" }
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
    vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>tr", builtin.resume, {})
  end
}
