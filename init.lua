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
--
---
---- 1. Add fennel.lua location to Lua module search path
package.path = package.path .. ";"
  .. "/nix/store/1z42sfd8lc3pnm83kxc8minz4jnjid1i-luajit2.1-fennel-1.5.3-1/share/lua/5.1/?.lua;"


local fennel = require("fennel")

fennel.install()
-- conjure completion setup
package.path = package.path .. ";"
  .. os.getenv("HOME") .. "/.config/waybar/fnl/?.fnl;"
  -- .. os.getenv("HOME") .. "/.config/waybar/scripts/?/init.fnl"
  -- .. os.getenv("HOME") .. "/.config/waybar/fnl/?.fnl;"
fennel.path = package.path
-- local mylib = require("module")

-- local module_path = os.getenv("HOME") .. "/.config/waybar/fnl/module.fnl"

-- load and compile the module via fennel
-- local mylib = fennel.dofile(module_path)
