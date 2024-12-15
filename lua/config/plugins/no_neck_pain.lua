-- https://github.com/shortcuts/no-neck-pain.nvim
return {{
	'shortcuts/no-neck-pain.nvim',
	version = "*",
	config = function()
		local nnp = require("no-neck-pain")
		nnp.setup {
			width = 150,
			buffers = { right = { enabled = false }},
		}
		vim.keymap.set('n', '<leader>tz', "<cmd>NoNeckPain<cr>", {desc="toggle no neck pain left" })
	end
}}
