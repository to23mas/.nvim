-- https://github.com/jiaoshijie/undotree
return {{
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = true,
	keys = {{
		'<leader>tu', '<cmd>lua require(\'undotree\').toggle()<cr>'
	}},
}}
