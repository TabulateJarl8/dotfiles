-- Set leader character to space
vim.g.mapleader = ' '

-- Buffer behavior
vim.o.relativenumber = true
vim.o.number = true
vim.o.signcolumn = 'number'
vim.o.splitbelow = true
vim.o.splitright = true

-- Yank to clipboard
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

-- Remap arrow keys to buffer movement
vim.api.nvim_set_keymap('n', '<LEFT>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<DOWN>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<UP>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<RIGHT>', '<C-w>l', { noremap = true, silent = true })
-- Remap ctrl+hjkl to buffer movement as well
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
