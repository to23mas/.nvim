-- https://github.com/hadronized/hop.nvim
return {{
	'phaazon/hop.nvim',
	branch = 'v2', -- optional but strongly recommended
	config = function()
		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		vim.keymap.set('n', '<leader>jw', "<cmd>HopWord<cr>", {desc="jump to [w]ord" })
		vim.keymap.set('n', '<leader>jjw', "<cmd>HopWordMW<cr>", {desc="jump to word" })
	end
}}
