require'soleus.nvim_settings'
require'soleus.nvim_remap'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup({

	---zen
	'folke/zen-mode.nvim',

	---dependencies
	'nvim-lua/plenary.nvim',
	---devicons
	'nvim-tree/nvim-web-devicons',

	---colorschemes
	{ 'rose-pine/neovim', name = 'rose-pine' },
	'rebelot/kanagawa.nvim',
	'Shatur/neovim-ayu',
	{ 'catppuccin/nvim', as = 'catppuccin', priority = 1000},

	---lualine
	'nvim-lualine/lualine.nvim',

	---telescope
	{'nvim-telescope/telescope.nvim', tag = '0.1.2'},

	---harpoon
	'ThePrimeagen/harpoon',

	---treesitter
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

	---whichkey
	{
		'folke/which-key.nvim',
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup{}
		end
	},

	--- comments
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	---git
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},

	---hop
	{'phaazon/hop.nvim', branch = 'v2'},

	---oil
	'stevearc/oil.nvim',

	--- lsp
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
		},
	},

	--- cmp
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'rafamadriz/friendly-snippets',
		},
	},

	---clojure
	{ 'Olical/conjure', ft = { "clojure" } },

	---spell checking
	'kamykn/spelunker.vim',
})
