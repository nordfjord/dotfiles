require("nordfjord.set")
local links = {
	["@lsp.type.namespace.typescript"] = "@type",
}

return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "<leader>pv", function()
				require("oil").toggle_float()
			end, { desc = "[P]roject [V]isual files" })
		end,
	},

	{
		"rose-pine/neovim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("rose-pine")
			for newgroup, oldgroup in pairs(links) do
				vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
			end
		end,
	},

	{
		"mfusenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				go = { "golangcilint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},

	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua", "hrsh7th/nvim-cmp" },
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local npairs = require("nvim-autopairs")
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			npairs.setup({})
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
		end,
	},
}
