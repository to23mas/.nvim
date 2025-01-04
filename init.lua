require("config.lazy")
require('config.nvim')
require('config.functions')

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.latte = {
	install_info = {
		url = "~/Documents/Programming/opensource/tree-sitter-latte", -- local path or git repo
		files = { "src/parser.c" },                             -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		generate_requires_npm = false,                          -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = true,                  -- if folder contains pre-generated src/parser.c
	},
	filetype = "latte",                                         -- if filetype does not match the parser name
}
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.latte",
	command = "set filetype=latte"
})
-- vim.cmd [[hi @function.builtin.lua guifg=yellow]]
-- vim.cmd [[hi @keyword.function.lua guifg=pink]]
