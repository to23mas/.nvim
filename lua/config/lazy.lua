-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- colorschemes
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'rose-pine/neovim',                 name = 'rose-pine' },
		{ 'catppuccin/nvim',                  as = 'catppuccin' },
		{ 'rebelot/kanagawa.nvim',            config = function() vim.cmd.colorscheme('kanagawa-wave') end },
		{ 'Shatur/neovim-ayu' },

		-- dependencies/plugins without config
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'kamykn/spelunker.vim' },

		-- plugins directory
		{ import = "config.plugins" },
	},

	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- automatically check for plugin updates
	checker = { enabled = false },
})
