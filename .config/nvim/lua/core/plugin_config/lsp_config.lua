require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "jdtls", "clangd" },
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

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
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

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
--[[ require("lspconfig").rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {'rust'},
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		['rust-analyzer'] = {
			cargo = {
				allFeatures = true,
			}
		}
	}
} ]]
--
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").jdtls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").clangd.setup({ on_attach = on_attach, capabilities = capabilities })
