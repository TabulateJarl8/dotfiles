require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		javascript = { "biome" },
		typescript = { "biome" },
		vue = { "prettier" },
		c = { "clang-format" },
		["_"] = { "trim_whitespace" },
	},
	-- dont format certain directories
	format_on_save = function(bufnr)
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if bufname:match("/qmk_firmware/") then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})

require("conform").formatters.prettier = {
	prepend_args = { "--vue-indent-script-and-style" },
}
