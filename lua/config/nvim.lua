local k = vim.keymap
local set = vim.opt
local cmd = vim.cmd.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- stops moving text on error
set.showmode = false
set.signcolumn = 'yes:1'
set.hlsearch = true

-- tab width
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.smartindent = false
set.number = true
set.relativenumber = true
-- line numbers
cmd('numberwidth=4')
cmd('spelllang=en_us')
cmd('nospell')
cmd('nowrap')

set.incsearch = true
set.termguicolors = true
set.scrolloff = 10
set.updatetime = 50
set.splitright = true
-- set.colorcolumn = "80"

set.list = true
set.listchars = { tab = '» ', trail = '⍿', nbsp = '⎵' }
set.cursorline = true
set.cindent = true
set.ignorecase = true
set.smartcase = true

-- latte
vim.cmd.au('BufRead,BufNewFile *.latte set filetype=html')

k.set('n', '<space><space>x', '<cmd>source %<CR>')
k.set('n', '<space><space>x', '<cmd>source %<CR>')
k.set("n", "<space>x", ":.lua<CR>")
k.set("v", "<space>x", ":lua<CR>")

k.set('i', "<C-@>", "<C-Space>")
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- k.set({'n','v'}, '<leader>pe', '<Cmd>Ex<Cr>', {desc='netrw'})
k.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = '[n]ew file' })

k.set({ 'n', 'v' }, '<leader>pr', '<Cmd>Rex<Cr>', { desc = 'netrw cursor on file' })
k.set('n', '<leader>wv', "<C-w>v", { desc = "split [v]erticaly" })
k.set('n', '<leader>wd', "<C-w><C-q>", { desc = "close window" })
k.set('n', '<leader>ww', "<C-w><C-w>", { desc = "switch [w]indows" })

k.set('n', '<leader>tt', '<cmd>terminal fish<cr>', { desc = '[t]erminal' })

k.set("v", "K", ":m '<-2<CR>gv=gv")
k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")

k.set("x", "<leader>p", [["_dP]])

k.set({ "n", "v" }, "<leader>y", [["+y]])

k.set("n", "<C-h>", "<cmd>cn<CR>")
k.set("n", "<C-l>", "<cmd>cp<CR>")
-- k.set('i', "<C-@>", "<C-Space>")

vim.keymap.set('n', '<leader>li',
	function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end,
	{ desc = 'inlay hint' })

-- yanking highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup('highlightYank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

-- snippets
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>alf", "ifile_put_contents('file.json', json_decode($));<Esc>==F$a")
