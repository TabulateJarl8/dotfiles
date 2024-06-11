-- Set leader character to space
vim.g.mapleader = " "

-- Yank to clipboard
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

-- Remap arrow keys to buffer movement
vim.keymap.set("n", "<LEFT>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<DOWN>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<UP>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<RIGHT>", "<C-w>l", { noremap = true, silent = true })
-- Remap ctrl+hjkl to buffer movement as well
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- insert a blank line below and above your cursor without going into insert mode
vim.keymap.set(
	"n",
	"<leader>o",
	[[:<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>]],
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>O",
	[[:<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>]],
	{ noremap = true, silent = true }
)

-- autocommand to set the file type to scss for tcss
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.tcss" },
	callback = function()
		vim.cmd("set filetype=scss")
	end,
})

-- debugging
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F6>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F7>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F8>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
local widgets = require("dap.ui.widgets")
local sidebar = widgets.sidebar(widgets.scopes)
vim.keymap.set("n", "<leader>ds", sidebar.open)

-- comment inserting
local comment = require("Comment.api")
vim.keymap.set("n", "<leader>/", comment.toggle.linewise.current)
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
vim.keymap.set("x", "<leader>/", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	comment.toggle.linewise(vim.fn.visualmode())
end)
