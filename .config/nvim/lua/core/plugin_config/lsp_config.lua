require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"jdtls",
		"clangd",
		"volar",
		"tsserver",
		"asm_lsp",
		"html",
		"cssmodules_ls",
		"css_variables",
		"cssls",
		"jsonls",
	},
})

local cmp = require("cmp")
-- local util = require("lspconfig/util")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "crates" },
	}, {
		{ name = "buffer" },
	}),
})
-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
)
require("cmp_git").setup() ]]
--
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

	-- inline type hints
	if vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(true, { 0 })
	end
end

-- rustaceanvim config
vim.g.rustaceanvim = function()
	return {
		server = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
		tools = {
			hover_actions = {
				auto_focus = true,
			},
		},
	}
end

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

local vue_lsp_path = require("mason-registry").get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = { plugins = { { name = "@vue/typescript-plugin", location = vue_lsp_path, languages = { "vue" } } } },
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
lspconfig.volar.setup({ on_attach = on_attach, capabilities = capabilities })

lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.jdtls.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.asm_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.cssmodules_ls.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.css_variables.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
