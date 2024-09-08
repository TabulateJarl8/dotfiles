require("neotest").setup({
	adapters = {
		require("rustaceanvim.neotest"),
		require("neotest-python")({
			dap = { justMyCode = false },
		}),
	},
})
