require("nordfjord.config")
require("nordfjord.keymap")

vim.pack.add({
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/ThePrimeagen/harpoon" },
	{ src = "https://github.com/nordfjord/vim-postgres" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
})

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

vim.cmd.colorscheme("rose-pine")

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-n>"] = { "show", "select_next", "fallback" },
		["<C-v>"] = { "snippet_forward", "fallback" },
		["<C-c>"] = { "snippet_backward", "fallback" },
		["<Tab>"] = {},
		["<S-Tab>"] = {},
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		menu = {
			auto_show = function(ctx)
				-- Do not ato-show autocompletion in cmdline
				return ctx.mode ~= "cmdline"
			end,
		},
		documentation = {
			auto_show = true,
			window = { border = "rounded" },
		},
	},

	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
})

require("todo-comments").setup({ signs = false })

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.ai").setup({ n_lines = 500 })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()

local statusline = require("mini.statusline")
statusline.setup({ use_icons = true })

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return "%2l:%-2v"
end

local oil = require("oil")
oil.setup()
vim.keymap.set("n", "<leader>pv", oil.open, { desc = "[P]roject [V]isual files" })

require("Comment").setup()

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

require("supermaven-nvim").setup({ keymaps = { accept_suggestion = "<A-l>" } })

local postgres = require("postgres")
postgres.setup({ env_var = "DATABASE_URL" })
vim.keymap.set("v", "<leader>pge", postgres.execute_visual, { desc = "[P]ost[G]res [E]xecute" })
vim.keymap.set("n", "<leader>pge", postgres.execute_current, { desc = "[P]ost[G]res [E]xecute" })

require("nordfjord.plugins.conform")
require("nordfjord.plugins.lsp")
require("nordfjord.plugins.harpoon")
require("nordfjord.plugins.telescope")
require("nordfjord.plugins.treesitter")

vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>u", function()
	require("undotree").open({ command = "leftabove 40vnew" })
end, { desc = "[U]ndotree" })
