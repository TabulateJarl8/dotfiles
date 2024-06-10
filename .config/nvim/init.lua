-- Get the current file path
local current_file = debug.getinfo(1, "S").source:sub(2)

-- Extract the directory from the path
local current_dir = current_file:match("(.*/)")
local plugins_vim_path = current_dir .. "plugins.vim"
vim.cmd("source " .. plugins_vim_path)
require("core.keymaps")
require("core.plugin_config")
require("core.config")
