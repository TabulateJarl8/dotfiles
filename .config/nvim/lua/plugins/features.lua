-- This file contains configuration for plugins that add new features to the editor
return {
	-- Wakatime metrics
	{ "wakatime/vim-wakatime", lazy = false },
	-- Discord RPC
	{ "andweeb/presence.nvim", lazy = false },
	-- Silicon code image generation
	{
		"krivahtoo/silicon.nvim",
		build = "./install.sh",
		opts = {
			font = "Hack=16",
			theme = "Catppuccin Mocha",
			background = "#ABB8C3",
			output = { clipboard = true },
			line_number = true,
			pad_vert = 30,
			pad_horiz = 30,
			gobble = true,
			window_title = function()
				return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
			end,
		},
	},
	-- gitignore downloader
	{
		"wintermute-cell/gitignore.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			vim.keymap.set("n", "<leader>gi", function()
				require("gitignore").generate({ path = "./.gitignore" })
			end),
		},
	},
	-- project-wide diagnostics reference
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
