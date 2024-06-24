" Set up vim-plug automatically
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
autocmd VimEnter * PlugInstall
endif

" Import plugins
call plug#begin(stdpath('config').'/autoload/plugged')
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'm4xshen/autoclose.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'stable' }
Plug 'rust-lang/rust.vim'
Plug 'mrcjkb/rustaceanvim'
Plug 'numToStr/Comment.nvim'
Plug 'stevearc/conform.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'mfussenegger/nvim-dap'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'wintermute-cell/gitignore.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'andweeb/presence.nvim'
Plug 'chomosuke/typst-preview.nvim', {'tag': 'v0.3.*', 'do': ':TypstPreviewUpdate'}
call plug#end()
