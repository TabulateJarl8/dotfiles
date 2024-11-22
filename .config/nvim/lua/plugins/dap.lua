-- This file contains configuration for plugins related to debugging
return {
	-- debug adapter protocol for debugging
	{
		"mfussenegger/nvim-dap",
		dependencies = { "williamboman/mason.nvim" },
		init = function()
			vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, bg = "#444a57" })
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {
			ensure_installed = { "codelldb", "python" },
			automatic_installation = true,
			handlers = {},
		},
	},
	-- show hints of variable values as virtual text while debugging
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "nvim-treesitter/nvim-treesitter", "mfussenegger/nvim-dap" },
		opts = { virt_text_pos = "eol" },
	},
}
