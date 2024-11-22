-- This file contains the configuration for in-editor test-related plugins
return {
	-- in-editor testing framework
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			"neovim/nvim-lspconfig",
			-- Languages
			"nvim-neotest/neotest-python",
			"mrcjkb/rustaceanvim",
		},
		config = function()
			-- lazy load due to issues with mason
			-- https://github.com/nvim-neotest/neotest/discussions/455
			require("neotest").setup({
				adapters = {
					require("rustaceanvim.neotest"),
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
				},
			})
		end,
		cmd = { "Neotest" },
	},
	-- code coverage reporting
	{
		"andythigpen/nvim-coverage",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { comamnds = true },
	},
}