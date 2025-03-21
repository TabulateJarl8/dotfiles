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

-- number refactoring
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- inc rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- make ctrl+del work in insert mode
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true, silent = true })

-- make escape in normal mode clear highlighting
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- clipboard management
vim.api.nvim_set_keymap("n", "<C-c>", ":Telescope neoclip<CR>", { noremap = true, silent = true })

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

-- comment inserting
local comment = require("Comment.api")
vim.keymap.set("n", "<leader>/", comment.toggle.linewise.current)
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
vim.keymap.set("x", "<leader>/", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	comment.toggle.linewise(vim.fn.visualmode())
end)

-- tabs
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-,>", "<Cmd>BufferMovePrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-.>", "<Cmd>BufferMoveNext<CR>", opts)

vim.api.nvim_set_keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

vim.api.nvim_set_keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>w", "<Cmd>BufferClose<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-x>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)

vim.api.nvim_set_keymap("n", "<A-l>", "<Cmd>BufferPick<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader><Space>", "<Cmd>Telescope buffers<CR>", opts)

-- multiline cursors
vim.api.nvim_set_var("VM_maps", {
	["Find Under"] = "<C-d>", -- replace C-n
	["Find Subword Under"] = "<C-d>", -- replace visual C-n
})

-- nvim-tree toggle
vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
