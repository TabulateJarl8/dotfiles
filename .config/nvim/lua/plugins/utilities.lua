-- This file contains configuration for some more utility-like plugins
return {
	-- Treesitter
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	build = ":TSUpdate",
	-- 	branch = "main",
	-- 	config = function()
	-- 		-- A list of parser names, or "all" (the five listed parsers should always be installed)
	-- 		local ensure_installed = {
	-- 			"c",
	-- 			"lua",
	-- 			"vim",
	-- 			"vimdoc",
	-- 			"query",
	-- 			"rust",
	-- 			"python",
	-- 			"javascript",
	-- 			"typescript",
	-- 			"markdown",
	-- 			"markdown_inline",
	-- 			"html",
	-- 			"css",
	-- 			"scss",
	-- 		}
	--
	-- 		require("nvim-treesitter").install(ensure_installed)
	--
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			pattern = { "*" },
	-- 			callback = function(args)
	-- 				local ft = vim.bo[args.buf].filetype
	-- 				local lang = vim.treesitter.language.get_lang(ft)
	--
	-- 				if lang ~= nil and not vim.treesitter.language.add(lang) then
	-- 					local available = vim.g.ts_available or require("nvim-treesitter").get_available()
	-- 					if not vim.g.ts_available then
	-- 						vim.g.ts_available = available
	-- 					end
	-- 					if vim.tbl_contains(available, lang) then
	-- 						require("nvim-treesitter").install(lang)
	-- 					end
	-- 				end
	--
	-- 				if lang ~= nil and vim.treesitter.language.add(lang) then
	-- 					vim.treesitter.start(args.buf, lang)
	-- 				end
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "90cd658",
		main = "nvim-treesitter",
		-- build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			local highlight = function(bufnr, lang)
				-------------------[ treesitter highlights ]-------------------------------
				if not vim.treesitter.language.add(lang) then
					return vim.notify(
						string.format("Treesitter cannot load parser for language: %s", lang),
						vim.log.levels.INFO,
						{ title = "Treesitter" }
					)
				end
				vim.treesitter.start(bufnr)
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = vim.bo.filetype
					local bt = vim.bo.buftype
					local buf = args.buf

					if bt ~= "" then
						return
					end -- don't run further.

					local ok, treesitter = pcall(require, "nvim-treesitter")
					if not ok then
						return
					end

					vim.schedule(function()
						-- Only run normal if we're not in terminal mode
						if vim.fn.mode() ~= "t" then
							vim.cmd("silent! normal! zx")
						end
					end)

					---------------------[ treesitter indent ]-------------------------------

					if not vim.tbl_contains({ "python", "html", "yaml", "markdown" }, ft) then
						vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
					end

					--------------------[ treesitter parsers ]-------------------------------
					if vim.fn.executable("tree-sitter") ~= 1 then
						vim.api.nvim_echo({
							{
								"tree-sitter CLI not found. Parsers cannot be installed.",
								"ErrorMsg",
							},
						}, true, {})
						return false
					end

					if not vim.treesitter.language.get_lang(ft) then
						return
					end

					if vim.list_contains(treesitter.get_installed(), ft) then
						highlight(buf, ft)
					elseif vim.list_contains(treesitter.get_available(), ft) then
						treesitter.install(ft):await(function()
							highlight(buf, ft)
						end)
					end
				end,
			})
		end,
		opts = {
			install = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"python",
				"javascript",
				"typescript",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"scss",
			},
		},
		config = function(_, opts)
			local treesitter = require("nvim-treesitter")
			treesitter.setup(opts)
			if vim.fn.executable("tree-sitter") ~= 1 then
				vim.api.nvim_echo({
					{
						"tree-sitter CLI not found. Parsers cannot be installed.",
						"ErrorMsg",
					},
				}, true, {})
				return false
			end
			treesitter.install(opts.install)
		end,
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				file_ignore_patterns = { ".git/" },
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
			},
		},
		init = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, {})
		end,
	},
	-- Automatic rebuilding of spell files on launch
	{
		"micarmst/vim-spellsync",
		lazy = false,
	},
}
