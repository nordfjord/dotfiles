local links = {
	["@lsp.type.namespace.typescript"] = "@type",
}

vim.g.table_mode_disable_mappings = true
vim.g.table_mode_disable_tableize_mappings = true

return {
	{ "numToStr/Comment.nvim", opts = {} },

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"dhruvasagar/vim-table-mode",
		config = function()
			vim.keymap.set("n", "<leader>tm", vim.cmd.TableModeToggle)
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
			end, { desc = "[A]dd current file to harpoon list" })
			vim.keymap.set("n", "<C-s>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "[S]earch harpoon list" })

			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(1)
			end, { desc = "Go to 1st harpooned file" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon:list():select(2)
			end, { desc = "Go to 2nd harpooned file" })
			vim.keymap.set("n", "<C-i>", function()
				harpoon:list():select(3)
			end, { desc = "Go to 3rd harpooned file" })
			vim.keymap.set("n", "<C-m>", function()
				harpoon:list():select(4)
			end, { desc = "Go to 4th harpooned file" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end, { desc = "Go to [P]revious harpooned file" })
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end, { desc = "Go to [N]ext harpooned file" })
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

	{
		-- uncomment when developing
		-- dir = "/home/nordfjord/git/nordfjord/vim-postgres",
		"nordfjord/vim-postgres",
		config = function(_, opts)
			require("postgres").setup(opts)
			vim.keymap.set("v", "<leader>pge", function()
				require("postgres").execute_visual()
			end, { desc = "[P]ost[G]res [E]xecute" })
			vim.keymap.set("n", "<leader>pge", function()
				require("postgres").execute_current()
			end, { desc = "[P]ost[G]res [E]xecute" })
		end,
		opts = {
			env_var = "DATABASE_URL",
		},
	},

	{ "adelarsq/neofsharp.vim" },
}
