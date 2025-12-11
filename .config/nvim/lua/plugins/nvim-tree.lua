-- This file contains the configuration for the nvim-tree file browser
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		-- disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- enable 24-bit colour
		vim.opt.termguicolors = true
	end,
	opts = {
		renderer = {
			highlight_git = true,
		},
		filters = {
			git_ignored = false,
		},
	},
}
