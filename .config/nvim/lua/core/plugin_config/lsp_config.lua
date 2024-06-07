require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "jdtls" }
})

local on_attach = function(_, bufnr)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup { on_attach = on_attach }
require("lspconfig").rust_analyzer.setup { on_attach = on_attach }
require("lspconfig").pyright.setup { on_attach = on_attach }
require("lspconfig").jdtls.setup { on_attach = on_attach }
