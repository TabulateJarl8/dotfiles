-- This file contains configuration for plugins relating to editor appearance
return {
	-- theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha",
			integrations = {
				nvimtree = true,
				treesitter = true,
				mason = true,
				telescope = true,
				gitsigns = true,
				neotest = true,
				cmp = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- git status integration
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
	},
	-- Highlight colors with themselves in editor
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
	-- Tab bar
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- for git status
			"nvim-tree/nvim-web-devicons", -- for file icons
		},
	},
	-- TODO highlighting
	{
		"folke/todo-comments.nvim",
		opts = {},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- DAP UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			-- automatically open DAP UI on DAP startup
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	-- LSP Config progress indicator
	{
		"linrongbin16/lsp-progress.nvim",
	},
	-- LSP autocomplete pictograms
	{
		"onsails/lspkind.nvim",
	},
	-- Incremental Rename
	{
		"smjonas/inc-rename.nvim",
		opts = {},
	},
	-- Telescope code action preview
	{
		"aznhe21/actions-preview.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
