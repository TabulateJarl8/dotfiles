return {
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
}
