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
				require("oil").open()
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
		"mfussenegger/nvim-lint",
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
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-j>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-i>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-m>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},

	{
		"olexsmir/gopher.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
			vim.keymap.set("n", "<leader>ctj", "<cmd>GoTagAdd json<CR>", { desc = "[Go] [struct] add [json] tags" })
			vim.keymap.set("n", "<leader>cie", "<cmd>GoIfErr<CR>", { desc = "[C]ode add [if] [err]" })
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
