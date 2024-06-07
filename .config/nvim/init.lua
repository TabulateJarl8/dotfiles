-- Get the current file path
local current_file = debug.getinfo(1, 'S').source:sub(2)

-- Extract the directory from the path
local current_dir = current_file:match("(.*/)")
local plugins_vim_path = current_dir .. 'plugins.vim'
vim.cmd('source ' .. plugins_vim_path)
require("core.keymaps")
require("core.plugin_config")

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
