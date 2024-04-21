local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>lr', vim.lsp.buf.rename, 'language server rename')
	nmap('<leader>la', vim.lsp.buf.code_action, 'language server code action')
	vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, opts)
	nmap('gd', vim.lsp.buf.definition, 'Goto Definition')

	vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, { desc = 'signature help' })

	nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
	nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
	nmap('gD', vim.lsp.buf.type_definition, 'Type Definition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { desc = 'signature help' })

	-- Lesser used LSP functionality
	-- nmap('<leader>D', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

local servers = {
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	tailwindcss = {
		Lua = {
			filetypes = {"htmldajngo", "html", "nette"},
		},
	},
}
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}

require('lspconfig').tailwindcss.setup{
	filetypes = {"htmldajngo", "html", "nette"},
}
--
-- -- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', 'gL', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.diagnostic.config {
	float = {
		border = "rounded"
	}
}
