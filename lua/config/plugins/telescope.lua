-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
return { {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require('telescope').setup({
			pickers = {
				find_files = { theme = 'ivy' }
			},
			extensions = {
				fzf = {}
			}
		})

		require('telescope').load_extension('fzf')
		local builtin = require('telescope.builtin')
		local k = vim.keymap
		k.set('n', '<leader>pN', function()
			builtin.find_files({
				cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
			})
		end)

		k.set('n', '<leader>pn', function()
			builtin.find_files({
				cwd = vim.fn.stdpath('config')
			})
		end)

		k.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'open [r]ecent file' })
		k.set('n', '<leader>gb', function() builtin.git_branches() end, { desc = "[g]it branches" })

		k.set('n', '<leader>gf', function() builtin.git_files() end, { desc = "[g]it files" })
		k.set('n', '<leader>gd', function() builtin.diagnostics() end, { desc = "[s]earch diagnostics" })
		k.set('n', '<leader>gl', function() builtin.lsp_definitions({ jump_type = 'vsplit' }) end,
			{ desc = 'jump to split' })
		k.set('n', '<leader>pf', function() builtin.find_files() end, { desc = "[f]ind files" })
		k.set('n', '<leader>pF', function() builtin.find_files({ hidden = true, no_ignore = true }) end,
			{ desc = "[F]ind all files" })
		k.set('n', '<leader>pw', function() builtin.grep_string() end, { desc = "search word" })
		k.set('n', '<leader>pb', function() builtin.buffers() end, { desc = "search [b]uffers" })
		k.set('n', '<leader>ph', function() builtin.help_tags() end, { desc = "[h]elp search" })
		k.set('n', '<leader>pm', function() builtin.marks() end, { desc = "marks" })


		require 'config.extensions.telescope.multigrep'.setup()
	end
} }
