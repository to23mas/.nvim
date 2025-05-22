-- https://github.com/neovim/nvim-lspconfig
return { {
	'williamboman/mason.nvim',
	config = function()
		require('mason').setup {}
	end
}, {
	'williamboman/mason-lspconfig.nvim',
	config = function()
		require('mason-lspconfig').setup {}
	end
}, {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'j-hui/fidget.nvim', opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		-- vim.api.nvim_create_autocmd('LspAttach', {
		-- 	callback = function(args)
		-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- 		if not client then
		-- 			return
		-- 		end
		--
		-- 		if client.supports_method('textDocument/formatting') then
		-- 			-- Format the current buffer on save
		-- 			local disabled_filetypes = { 'html', 'latte', 'php', 'json' }
		-- 			-- local disabled_filetypes = { 'json' }
		-- 			-- local disabled_filetypes = {}
		-- 			if vim.tbl_contains(disabled_filetypes, vim.bo.ft) then
		-- 				return
		-- 			end
		-- 			vim.api.nvim_create_autocmd('BufWritePre', {
		-- 				buffer = args.buf,
		-- 				callback = function()
		-- 					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
		-- 				end,
		-- 			})
		-- 		end
		-- 	end,
		-- })

		local nmap = function(keys, func, desc)
			if desc then
				desc = 'LSP: ' .. desc
			end
			vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
		end

		nmap('<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, '[W]orkspace [L]ist Folders')

		nmap('<leader>lr', vim.lsp.buf.rename, 'language server rename')
		vim.keymap.set('n', '<leader>lR', '<cmd>LspRestart<cr>', { desc = 'reload lsp' })
		nmap('<leader>lr', vim.lsp.buf.rename, 'language server rename')
		nmap('<leader>la', vim.lsp.buf.code_action, 'language server code action')
		vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
		nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
		nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
		nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
		nmap('gD', vim.lsp.buf.type_definition, 'Type Definition')
		nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
		nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

		-- See `:help K` for why this keymap
		-- Lesser used LSP functionality
		-- nmap('<leader>D', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
		-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')

		-- Create a command `:Format` local to the LSP buffer
		-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		-- 	-- vim.lsp.buf.format()
		-- end, { desc = 'Format current buffer with LSP' })

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers

		-- -- Diagnostic keymaps
		vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
		vim.keymap.set('n', 'gL', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

		require("lspconfig").tailwindcss.setup({
			filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
			root_dir = require("lspconfig.util").root_pattern(
				'tailwind.config.js',
				'tailwind.config.cjs',
				'postcss.config.js',
				'package.json',
				'.git'
			),
		})
	end
} }
