require("no-neck-pain").setup({
	width = 150,
	buffers = {
		right = {
			enabled = false,
		},
	},
})
vim.keymap.set('n', '<leader>tz', "<cmd>NoNeckPain<cr>", {desc="toggle no neck pain left" })
--
