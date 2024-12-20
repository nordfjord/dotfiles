require("nordfjord.set")
require("nordfjord.globals")

local links = {
	["@lsp.type.namespace.typescript"] = "@type",
}

vim.g.table_mode_disable_mappings = true
vim.g.table_mode_disable_tableize_mappings = true

return {
	{
		"dhruvasagar/vim-table-mode",
		config = function()
			vim.keymap.set("n", "<leader>tm", vim.cmd.TableModeToggle)
		end,
	},
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

	{
		"mfussenegger/nvim-dap",
		init = function()
			local dap = require("dap")
			vim.keymap.set("n", "<leader>dus", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end, { desc = "[D]ebug [U]I [S]idebar" })
			vim.keymap.set("n", "<leader>dsc", dap.continue, { desc = "[D]ebug [S]tep [C]ontinue" })
			vim.keymap.set("n", "<leader>dss", dap.step_over, { desc = "[D]ebug [S]tep Over" })
			vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "[D]ebug [S]tep [I]nto" })
			vim.keymap.set("n", "<leader>dso", dap.step_out, { desc = "[D]ebug [S]tep [O]ut" })
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
			vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, { desc = "[D]ebug [B]reakpoint (set)" })
			vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "[D]ebug [R]epl" })
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "[D]ebug [H]over" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "[D]ebug [P]review" })
		end,
	},

	{
		"leoluz/nvim-dap-go",
		dependencies = "mfussenegger/nvim-dap",
		ft = "go",
		config = function(_, opts)
			local dap = require("dap-go")
			dap.setup(opts)
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end)

			vim.keymap.set("n", "<leader>dt", dap.debug_test, { desc = "[D]ebug [T]est" })
			vim.keymap.set("n", "<leader>dlt", dap.debug_last, { desc = "[D]ebug [L]ast [T]est" })
		end,
	},
	{ "adelarsq/neofsharp.vim" },
	{ "rescript-lang/vim-rescript", ft = "rescript" },
}
