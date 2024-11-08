-- Plugins that require no configuration other than a setup
require("crates").setup()
require("nvim-autopairs").setup({})
require("nvim-highlight-colors").setup({})
require("nvim-ts-autotag").setup()
require("mason-conform").setup()
require("coverage").setup({ comamnds = true })
require("todo-comments").setup()
require("nvim-surround").setup()
require("lsp-progress").setup({})
require("inc_rename").setup({})
require("marp").setup()
require("nvim-dap-virtual-text").setup({ virt_text_pos = "eol" })
require("venv-selector").setup()
