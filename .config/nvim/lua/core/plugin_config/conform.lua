require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		javascript = { "biome" },
		typescript = { "biome" },
		vue = { "prettier" },
		c = { "clang-format" },
		markdown = { "prettier" },
		java = { "google-java-format" },
		latex = { "latexindent" },
		["_"] = { "trim_whitespace" },
	},
	-- dont format certain directories
	format_after_save = function(bufnr)
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if bufname:match("/qmk_firmware/") or bufname:match("/csm/documentation/") then
			return
		end
		return { lsp_fallback = true } --timeout_ms = 500, lsp_fallback = true }
	end,
})

require("conform").formatters.prettier = {
	prepend_args = { "--vue-indent-script-and-style" },
}
