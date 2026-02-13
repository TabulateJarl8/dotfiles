-- This file holds the configuration for the status line
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "linrongbin16/lsp-progress.nvim" },
		lazy = false,
		config = function(_, _)
			local custom_filename = require("lualine.components.filename"):extend()
			custom_filename.apply_icon = require("lualine.components.filetype").apply_icon
			custom_filename.icon_hl_cache = {}

			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = {
						{
							custom_filename,
							colored = true,
						},
					},
					lualine_x = {
						{ -- Setup lsp-progress component
							function()
								return require("lsp-progress").progress()
							end,
							icon = { "", align = "right" },
						},
						"diagnostics",
					},
					lualine_y = { "filetype", "encoding", "fileformat" },
					lualine_z = { "location" },
				},
			})
			-- listen lsp-progress event and refresh lualine
			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = "lualine_augroup",
				pattern = "LspProgressStatusUpdated",
				callback = require("lualine").refresh,
			})
		end,
	},
}
