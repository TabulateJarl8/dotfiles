-- Delete whitespace autocmd
vim.cmd([[
augroup DeleteWhitespace
    autocmd!
    autocmd BufWritePre * let currPos = getpos(".")
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] % !astyle -A10s4cxC100S
    autocmd BufWritePre *.[ch] %s/\%$/\r/e
    autocmd BufWritePre * call cursor(currPos[1], currPos[2])
augroup END
]])

-- Buffer behavior
vim.o.relativenumber = true
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = "yes"

-- ensure termguicolors is enabled for nvim-highlight-colors
vim.opt.termguicolors = true

-- tab behavior
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- for rust-lang/rust.vim
-- enable syntax highlighting
vim.api.nvim_command("syntax enable")
-- enable filetype detections, plugins, and auto indenting
vim.api.nvim_command("filetype plugin indent on")
vim.g.rustfmt_autosave = 1

-- show whitespace
-- set list listchars=tab:»\ ,trail:·,nbsp:⎵,precedes:<,extends:>,leadmultispace:·
vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "⎵",
	precedes = "<",
	extends = ">",
	leadmultispace = "·",
}
