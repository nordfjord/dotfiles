local treesitter = require("nvim-treesitter")
local auto_install = {
	"bash",
	"c",
	"elixir",
	"fish",
	"fsharp",
	"go",
	"html",
	"javascript",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"svelte",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"zig",
}
treesitter.install(auto_install)

local pattern = vim.list_extend(vim.deepcopy(auto_install), { "typescriptreact" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = pattern,
	callback = function()
		vim.treesitter.start()
	end,
})
