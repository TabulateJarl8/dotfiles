-- This file contains all of the LSP configurations
return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
	-- Define which LSPs should be autoinstalled here
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"basedpyright",
				"clangd",
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
				"tinymist",
				"gopls",
				"gitlab_ci_ls",
				"ruby_lsp",
				"hls",
			},
			-- automatic_installation = false,
			-- automatic_setup = false,
			-- automatic_enable = false,
			handlers = nil,
		},
	},
	-- Java LSP support
	-- WARN: currently broken until https://github.com/nvim-java/nvim-java/issues/427 is resolved
	-- {
	-- 	"nvim-java/nvim-java",
	-- 	opts = {
	-- 		spring_boot_tools = {
	-- 			enable = false,
	-- 		},
	-- 		jdk = {
	-- 			auto_install = false,
	-- 		},
	-- 		root_markers = {
	-- 			".javaroot",
	-- 			"settings.gradle",
	-- 			"settings.gradle.kts",
	-- 			"pom.xml",
	-- 			"build.gradle",
	-- 			"mvnw",
	-- 			"gradlew",
	-- 			"build.gradle",
	-- 			"build.gradle.kts",
	-- 			".git",
	-- 		},
	-- 	},
	-- },
	-- Rust LSP support
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {},
	},
	-- {
	-- 	"mrcjkb/haskell-tools.nvim",
	-- 	version = "^6", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- },
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
					{
						name = "lazydev",
						group_index = 0, -- set group index to 0 to skip loading LuaLS completions
					},
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
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-java/nvim-java",
			"mrcjkb/rustaceanvim",
			"aznhe21/actions-preview.nvim",
			-- "mrcjkb/haskell-tools.nvim",
		},
		config = function(_, _)
			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
				-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
				vim.keymap.set("n", "gu", require("telescope.builtin").lsp_references, {})
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

				-- inline type hints
				local caps = client.server_capabilities
				if vim.lsp.inlay_hint and (caps.inlayHintProvider or caps.inlayHintsProvider) then
					if vim.bo[bufnr].filetype ~= "cabal" then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end
				end
			end

			local default_config_servers = {
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
				"lua_ls",
				"gopls",
				"gitlab_ci_ls",
				"ruby_lsp",
				-- "hls",
			}

			-- setup servers that just have the default config
			for _, server in ipairs(default_config_servers) do
				vim.lsp.config(server, { on_attach = on_attach, capabilities = capabilities })
			end

			vim.lsp.config(
				"hls",
				{ on_attach = on_attach, capabilities = capabilities, filetypes = { "haskell", "lhaskell", "cabal" } }
			)

			-- vim.g.haskell_tools = {
			-- 	hls = {
			-- 		on_attach = on_attach,
			-- 	},
			-- }

			-- rustaceanvim config
			vim.g.rustaceanvim = function()
				return {
					server = {
						on_attach = on_attach,
						capabilities = capabilities,
						default_settings = {
							["rust-analyzer"] = {
								cargo = {
									features = "all",
								},
								check = {
									features = "all",
								},
							},
						},
					},
					tools = {
						hover_actions = {
							auto_focus = true,
						},
					},
				}
			end

			-- Add vue support to typescript
			local vue_lsp_path = vim.fn.expand("$MASON/packages/vue-language-server")
				.. "/node_modules/@vue/language-server"
			vim.lsp.config("ts_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					plugins = { { name = "@vue/typescript-plugin", location = vue_lsp_path, languages = { "vue" } } },
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			vim.lsp.config("tinymist", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					formatterMode = "typstyle",
				},
			})

			-- gitlab_ci_ls support
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.gitlab-ci*.{yml,yaml}",
				callback = function()
					vim.bo.filetype = "yaml.gitlab"
				end,
			})

			-- Java LS support
			vim.lsp.config("jdtls", {
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
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
