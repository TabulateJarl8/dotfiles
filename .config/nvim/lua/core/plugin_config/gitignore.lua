local gitignore = require("gitignore")
local my_path = "./.gitignore"
vim.keymap.set("n", "<leader>gi", function()
	gitignore.generate(my_path)
end)
