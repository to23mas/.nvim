require("oil").setup({
	default_file_explorer = false,
	skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "<leader>pe", "<CMD>Oil<CR>", { desc = "Open parent directory" })
