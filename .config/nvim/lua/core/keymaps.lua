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
vim.keymap.set('n', '<LEFT>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<DOWN>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<UP>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<RIGHT>', '<C-w>l', { noremap = true, silent = true })
-- Remap ctrl+hjkl to buffer movement as well
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- insert a blank line below and above your cursor without going into insert mode
vim.keymap.set('n', '<leader>o', [[:<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>O', [[:<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>]], { noremap = true, silent = true })

-- comment inserting
local comment = require('Comment.api')
vim.keymap.set('n', '<leader>/', comment.toggle.linewise.current)
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
vim.keymap.set('x', '<leader>/', function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            comment.toggle.linewise(vim.fn.visualmode())
        end)
