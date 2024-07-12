-- local dap = require("dap")
require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb", "python" },
	automatic_installation = true,
	handlers = {},
})

-- dap.adapters.lldb = {
-- 	type = "executable",
-- 	command = "/usr/bin/lldb-vscode",
-- 	name = "lldb",
-- }
--
-- dap.configurations.c = {
-- 	{
-- 		name = "Launch",
-- 		type = "lldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 		args = {},
-- 	},
-- }
--
-- dap.configurations.rust = dap.configurations.c
