-- This file contains configuration for plugins related to debugging
return {
	-- debug adapter protocol for debugging
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		init = function()
			vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, bg = "#444a57" })
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Continue",
			},
			{
				"<F6>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step Into",
			},
			{
				"<F7>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step Over",
			},
			{
				"<F8>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step Out",
			},
			{
				"<F9>",
				function()
					require("dap").step_back()
				end,
				desc = "Debug: Step Back",
			},
			{
				"<Leader>dr",
				function()
					require("dap").restart()
				end,
				desc = "Debug: Restart",
			},
			{
				"<Leader>ds",
				function()
					require("dap").close()
				end,
				desc = "Debug: Stop",
			},
			{
				"<Leader>dc",
				function()
					require("dap").disconnect()
				end,
				desc = "Debug: Disconnect",
			},
			{
				"<Leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: Toggle Breakpoint",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "codelldb", "python" },
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
				python = function(config)
					local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
					config.configurations = {
						{
							-- The first three options are required by nvim-dap
							type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
							request = "launch",
							name = "Python: Launch file",
							program = "${file}", -- This configuration will launch the current file if used.
							-- venv on Windows uses Scripts instead of bin
							pythonPath = venv_path
									and ((vim.fn.has("win32") == 1 and venv_path .. "/Scripts/python") or venv_path .. "/bin/python")
								or nil,
							console = "integratedTerminal",
							justMyCode = false,
						},
					}
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		},
	},
	-- show hints of variable values as virtual text while debugging
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "nvim-treesitter/nvim-treesitter", "mfussenegger/nvim-dap" },
		opts = { virt_text_pos = "eol" },
		lazy = true,
	},
}
