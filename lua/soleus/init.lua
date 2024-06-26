require'soleus.nvim_settings'
require'soleus.nvim_remap'

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

	---dependencies
	'nvim-lua/plenary.nvim',
	---devicon
	'nvim-tree/nvim-web-devicons',
	---no neck pain
	{"shortcuts/no-neck-pain.nvim", version = "*"},


	---colorschemes
	{ 'rose-pine/neovim', name = 'rose-pine' },
	'rebelot/kanagawa.nvim',
	'Shatur/neovim-ayu',
	{ 'catppuccin/nvim', as = 'catppuccin', priority = 1000},
	{ 'NTBBloodbath/sweetie.nvim' },
	{ 'Mofiqul/adwaita.nvim' },

	---lualine
	'nvim-lualine/lualine.nvim',

	---telescope
	{'nvim-telescope/telescope.nvim', branch = '0.1.x'},

	---harpoon
	'ThePrimeagen/harpoon',

	---treesitter
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

	---undo-tree history
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			{ "<leader>tu", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
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
	-- {
	-- 	'numToStr/Comment.nvim',
	-- 	config = function()
	-- 		require('Comment').setup()
	-- 	end
	-- },

	--- oil
	{
		'stevearc/oil.nvim',
		opts = {},
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
			'hrsh7th/cmp-path',
			'rafamadriz/friendly-snippets',
		},
	},

	---clojure
	{ 'Olical/conjure', ft = { "clojure", "fennel" } },

	---spell checking
	'kamykn/spelunker.vim',
})
