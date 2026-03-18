return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function(_, opts)
		local auto_install = {
			"bash",
			"c",
			"elixir",
			"fish",
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
		require("nvim-treesitter").install(auto_install)

		local pattern = vim.list_extend(vim.deepcopy(auto_install), { "typescriptreact" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = pattern,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
