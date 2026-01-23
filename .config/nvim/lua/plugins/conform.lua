-- This file contains configuration for plugins related to code formatting
return {
	{
		"stevearc/conform.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
				javascript = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				javascriptreact = { "biome" },
				vue = { "prettier" },
				svg = { "prettier" },
				html = { "prettier" },
				htmlhugo = { "prettier" },
				scss = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				markdown = { "prettier" },
				java = { "google-java-format" },
				latex = { "latexindent" },
				bash = { "shfmt" },
				yaml = { "prettier" },
				toml = { "taplo" },
				ruby = { "rubyfmt" },
				["_"] = { "trim_whitespace" },
			},
			-- dont format certain directories
			format_after_save = function(bufnr)
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/qmk_firmware/") then
					return
				end
				return { lsp_fallback = true } --timeout_ms = 500, lsp_fallback = true },
			end,
		},
		init = function()
			-- TODO: should i switch to prettierd? if so, how do i migrate this?
			require("conform").formatters.prettier = {
				prepend_args = { "--vue-indent-script-and-style" },
			}
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "stevearc/conform.nvim" },
		opts = {},
	},
}
