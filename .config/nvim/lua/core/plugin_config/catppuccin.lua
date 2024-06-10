require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		nvimtree = true,
		treesitter = true,
		mason = true,
		telescope = true,
	},
})

vim.cmd.colorscheme("catppuccin")
