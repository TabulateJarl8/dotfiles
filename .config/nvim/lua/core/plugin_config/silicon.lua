require("silicon").setup({
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
})
