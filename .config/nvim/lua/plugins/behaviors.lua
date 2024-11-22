-- This file contains configuration for plugins that modify or add to the behavior of the editor
return {
	-- Comment toggling
	{
		"numToStr/Comment.nvim",
		opts = {
			pre_hook = function()
				return vim.bo.commentstring
			end,
		},
		lazy = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- Documentation generation
	{
		"kkoomen/vim-doge",
		build = ":call doge#install()",
		init = function()
			vim.g.doge_doc_standard_python = "google"
			vim.g.doge_python_settings = {
				omit_redundant_param_types = 0,
				single_quotes = 0,
			}
		end,
	},
	-- Automatic pairing of surrounding delimiters
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- autoclose html tags
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		opts = {},
	},
	-- modify surrounding delimiter pairs
	{
		"kylechui/nvim-surround",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	-- Autodetect indentation type/level
	{
		"tpope/vim-sleuth",
	},
	-- Image pasting support
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
