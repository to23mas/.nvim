require('config.lazy')
require('config.nvim')
require('config.functions')

-- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.latte = {
-- 	install_info = {
-- 		url = '~/Documents/Programming/opensource/tree-sitter-latte', -- local path or git repo
-- 		files = { 'src/parser.c' },                             -- note that some parsers also require src/scanner.c or src/scanner.cc
-- 		-- optional entries:
-- 		generate_requires_npm = false,                          -- if stand-alone parser without npm dependencies
-- 		requires_generate_from_grammar = true,                  -- if folder contains pre-generated src/parser.c
-- 	},
-- 	filetype = 'latte',                                         -- if filetype does not match the parser name
-- }

vim.diagnostic.config({
	virtual_text = true, -- Disable virtual text
	signs = true,         -- Keep signs in the gutter (left side)
	underline = true,     -- Underline problematic code
	update_in_insert = false, -- Update diagnostics in insert mode
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = '*.latte',
	command = 'set filetype=html'
})

-- vim.cmd [[hi @function.builtin.lua guifg=yellow]]
-- vim.cmd [[hi @keyword.function.lua guifg=pink]]

vim.api.nvim_set_keymap('n', '==', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

-- require('lspconfig').clangd.setup{
--   cmd = { "/run/current-system/sw/bin/clangd" },  -- path to Nix-installed clangd
-- }
