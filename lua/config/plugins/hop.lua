-- https://github.com/hadronized/hop.nvim
return {{
	'phaazon/hop.nvim',
	branch = 'v2',
	keys = {
		{ '<leader>jw', "<cmd>HopWord<cr>", {desc="jump to [w]ord"} },
		{ '<leader>jjw', "<cmd>HopWordMW<cr>", {desc="jump to word"} },
	},
	config = function()
		local hop = require('hop')
		hop.setup { keys = 'etovxqpdygfblzhckisuran' }
	end
}}
