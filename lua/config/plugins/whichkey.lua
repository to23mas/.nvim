-- https://github.com/folke/which-key.nvim
return {{
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	}},
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require('which-key').setup{}
	end
}}
