-- This file contains configuration for plugins related to code formatting
return {
	{
		"stevearc/conform.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = function()
			local opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
					latex = { "latexindent" },
					bash = { "shfmt" },
					toml = { "taplo" },
					ruby = { "rubyfmt" },
					["_"] = { "trim_whitespace" },
				},
				formatters = {
					prettierd = {
						prepend_args = { "--vue-indent-script-and-style" },
					},
				},
				-- dont format certain directories
				format_after_save = function(bufnr)
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					if bufname:match("/qmk_firmware/") then
						return
					end
					return { lsp_fallback = true } --timeout_ms = 500, lsp_fallback = true },
				end,
			}

			local bulk_formatters = {
				prettierd = {
					"vue",
					"svg",
					"html",
					"htmlhugo",
					"scss",
					"css",
					"markdown",
					"yaml",
					"javascript",
					"typescript",
					"typescriptreact",
					"javascriptreact",
				},
				["clang-format"] = { "c", "cpp" },
			}
			for formatter, fts in pairs(bulk_formatters) do
				for _, ft in ipairs(fts) do
					opts.formatters_by_ft[ft] = { formatter }
				end
			end

			return opts
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "stevearc/conform.nvim" },
		opts = {},
	},
}
