-- This file contains configuration for plugins that add special language feature support
return {
	-- COBOL syntax highlighting
	{
		"Jorengarenar/COBOl.vim",
	},
	-- Rust Cargo.toml dependency version checking
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		tag = "stable",
		opts = {},
	},
	-- Extra Rust language support
	{
		"rust-lang/rust.vim",
	},
	-- Typst live preview
	{
		"chomosuke/typst-preview.nvim",
		version = "v1.*",
		opts = {},
		build = ":TypstPreviewUpdate",
	},
	-- LaTeX language support
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_general_viewer = "okular"
			vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
			vim.g.tex_flavor = "latex"
		end,
	},
	-- Hugo html template support
	{
		"phelipetls/vim-hugo",
	},
	-- Marp server support
	{
		"mpas/marp-nvim",
		opts = {},
	},
	-- Python venv selection
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		lazy = false,
		branch = "regexp",
		opts = {},
	},
}
