require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".git/" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
