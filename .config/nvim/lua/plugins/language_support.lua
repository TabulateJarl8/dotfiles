-- This file contains configuration for plugins that add special language feature support
return {
	-- COBOL syntax highlighting
	{
		"Jorengarenar/COBOl.vim",
		ft = "cobol",
	},
	-- Rust Cargo.toml dependency version checking
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		tag = "stable",
		opts = { completion = { cmp = { enabled = true } } },
	},
	-- Extra Rust language support
	{
		"rust-lang/rust.vim",
		ft = "rust",
	},
	-- Typst live preview
	{
		"chomosuke/typst-preview.nvim",
		version = "1.*",
		ft = "typst",
		opts = {
			-- use mason installation of tinymist
			dependencies_bin = { ["tinymist"] = "tinymist" },
		},
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
		ft = "htmlhugo",
	},
	-- Marp server support
	{
		"mpas/marp-nvim",
		opts = {},
		cmd = { "MarpStart", "MarpStop", "MarpStatus", "MarpToggle" },
	},
	-- Python venv selection
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		opts = {
			options = {
				enabled_cached_venvs = true,
				cached_venv_automatic_activation = true,
			},
		},
		keys = {
			{ "<Leader>vs", "<cmd>VenvSelect<CR>" },
		},
		ft = "python",
	},
	-- textual tcss highlighting
	{
		"cachebag/nvim-tcss",
		config = true,
		ft = "tcss",
	},
	-- vimdoc help
	{
		"OXY2DEV/helpview.nvim",
		lazy = false, -- Recommended

		-- In case you still want to lazy load
		-- ft = "help",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
