" Set up vim-plug automatically
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
autocmd VimEnter * PlugInstall
endif

" Import plugins
call plug#begin(stdpath('config').'/autoload/plugged')
" dependencies
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'antoinemadec/FixCursorHold.nvim'

"""""""""""""""""""""""
""" EDITOR FEATURES """
"""""""""""""""""""""""
" nvim-tree file manager
Plug 'nvim-tree/nvim-tree.lua'

" Java support
Plug 'nvim-java/nvim-java'
Plug 'nvim-java/lua-async-await'
Plug 'nvim-java/nvim-java-refactor'
Plug 'nvim-java/nvim-java-core'
Plug 'nvim-java/nvim-java-test'
Plug 'nvim-java/nvim-java-dap'
Plug 'MunifTanjim/nui.nvim'

" LSP integration
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'mfussenegger/nvim-dap'
Plug 'jay-babu/mason-nvim-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'

" Venv selection
Plug 'linux-cultist/venv-selector.nvim', { 'branch': 'regexp' }

" Linting
Plug 'mfussenegger/nvim-lint'
Plug 'rshkarin/mason-nvim-lint'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" Documentation generator
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" gitignore downloader
Plug 'wintermute-cell/gitignore.nvim'

" Discord RPC
Plug 'andweeb/presence.nvim'

" Testing
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-python'

Plug 'andythigpen/nvim-coverage'

" Wakatime metrics
Plug 'wakatime/vim-wakatime'

" Silicon code image generation
Plug 'krivahtoo/silicon.nvim', { 'do': './install.sh' }

" Marp integration
Plug 'mpas/marp-nvim'

"""""""""""""""""""""""""
""" EDITOR APPEARANCE """
"""""""""""""""""""""""""
" Theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" lualine
Plug 'nvim-lualine/lualine.nvim'

" Git integration
Plug 'lewis6991/gitsigns.nvim'

" Highlight colors with themselves in editor
Plug 'brenoprata10/nvim-highlight-colors'

" Tab bar
Plug 'romgrk/barbar.nvim'

" TODO highlighting
Plug 'folke/todo-comments.nvim'

" DAP UI
Plug 'rcarriga/nvim-dap-ui'

" LSP Config progress indicator
Plug 'linrongbin16/lsp-progress.nvim'

" LSP autocomplete pictograms
Plug 'onsails/lspkind.nvim'

" Incremental Rename
Plug 'smjonas/inc-rename.nvim'

" COBOL
Plug 'Jorengarenar/COBOl.vim'

" Telescope code actions
Plug 'aznhe21/actions-preview.nvim'

"""""""""""""""""""""""""""""""""
""" LANGUAGE SPECIFIC PLUGINS """
"""""""""""""""""""""""""""""""""
" Rust language integration
Plug 'saecki/crates.nvim', { 'tag': 'stable' }
Plug 'rust-lang/rust.vim'
Plug 'mrcjkb/rustaceanvim'

" Typst language support
Plug 'chomosuke/typst-preview.nvim', {'tag': 'v0.3.*', 'do': ':TypstPreviewUpdate'}

" LaTeX language support
Plug 'lervag/vimtex'

" Hugo template highlighting
Plug 'phelipetls/vim-hugo'

"""""""""""""""""""""""
""" EDITOR BEHAVIOR """
"""""""""""""""""""""""
" Autopairs
Plug 'windwp/nvim-autopairs'

" Comment toggling
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Format on save
Plug 'stevearc/conform.nvim'
Plug 'zapling/mason-conform.nvim'

" autoclose html tags
Plug 'windwp/nvim-ts-autotag'

" Surrounding pairs helpers
Plug 'kylechui/nvim-surround'

" Autodetect indentation type/level
Plug 'tpope/vim-sleuth'

" Multiline cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Image pasting support
Plug 'HakonHarnes/img-clip.nvim'

" Easy clipboard handling
Plug 'AckslD/nvim-neoclip.lua'
call plug#end()
