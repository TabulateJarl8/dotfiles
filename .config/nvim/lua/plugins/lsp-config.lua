-- This file contains all of the LSP configurations
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	-- Define which LSPs should be autoinstalled here
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"basedpyright",
				"jdtls",
				"clangd",
				"volar",
				"ts_ls",
				"asm_lsp",
				"html",
				"cssmodules_ls",
				"css_variables",
				"cssls",
				"jsonls",
				"texlab",
				"taplo",
				"bashls",
				"typst_lsp",
			},
		},
	},
	-- Java LSP support
	{
		"nvim-java/nvim-java",
		opts = {
			spring_boot_tools = {
				enable = false,
			},
			jdk = {
				auto_install = false,
			},
			root_markers = {
				".javaroot",
				"settings.gradle",
				"settings.gradle.kts",
				"pom.xml",
				"build.gradle",
				"mvnw",
				"gradlew",
				"build.gradle",
				"build.gradle.kts",
				".git",
			},
		},
	},
	-- Rust LSP support
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	-- completition library
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			-- local util = require("lspconfig/util")

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- use vsnip
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
					{ name = "crates" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = {
							menu = 50,
							abbr = 50,
						},
						ellipsis_char = "...",
						show_labelDetails = true,
					}),
				},
			})
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
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-java/nvim-java",
			"mrcjkb/rustaceanvim",
		},
		config = function(_, _)
			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
				-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
				vim.keymap.set("n", "gu", require("telescope.builtin").lsp_references, {})
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

				-- inline type hints
				if vim.lsp.inlay_hint then
					vim.lsp.inlay_hint.enable(true, { 0 })
				end
			end

			local lspconfig = require("lspconfig")
			local default_config_servers = {
				"volar",
				"basedpyright",
				"clangd",
				"asm_lsp",
				"html",
				"cssmodules_ls",
				"cssls",
				"jsonls",
				"texlab",
				"taplo",
				"bashls",
				"typst_lsp",
			}

			-- setup servers that just have the default config
			for _, server in ipairs(default_config_servers) do
				lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
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

			-- Lua LS
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			-- Add vue support to typescript
			local vue_lsp_path = require("mason-registry").get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					plugins = { { name = "@vue/typescript-plugin", location = vue_lsp_path, languages = { "vue" } } },
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			-- Java LS support
			lspconfig.jdtls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					java = {
						project = {
							referencedLibraries = {
								"lib/**/*.jar",
							},
							sourcePaths = {
								"src",
							},
							outputPath = "bin",
						},
						debug = {
							settings = {
								stepping = {
									skipClasses = {
										"$JDK",
										"$Libraries",
									},
								},
							},
						},
					},
				},
			})
		end,
	},
}
