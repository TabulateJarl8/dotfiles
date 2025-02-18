-- This file contains configuration for plugins related to linting
return {
	-- linter support
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		config = function()
			require("lint").linters_by_ft = {
				java = { "checkstyle" },
				python = { "ruff" },
				vue = { "eslint_d" },
				typescriptreact = { "biomejs" },
				javascriptreact = { "biomejs" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		-- TODO: change this back once https://github.com/rshkarin/mason-nvim-lint/pull/20 is merged
		"TabulateJarl8/mason-nvim-lint",
		branch = "patch-1",
		lazy = false,
		dependencies = { "mfussenegger/nvim-lint" },
		opts = {},
	},
}
