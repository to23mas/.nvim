-- https://github.com/lewis6991/gitsigns.nvim
return {{
	'lewis6991/gitsigns.nvim',
	config = function()
		local gs = require("gitsigns")
		vim.keymap.set("n", "<leader>gsb", function() gs.toggle_current_line_blame() end)
	end
}}
