-- stops moving text on error
vim.opt.signcolumn = 'yes:1'

-- tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = false
vim.opt.number = true
vim.opt.relativenumber = true
-- line numbers
vim.cmd.set('numberwidth=4')
-- spelling
vim.cmd.set('spelllang=en_us')
vim.cmd.set('nospell')

vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

vim.cmd.set('listchars=tab:⤑⤑,trail:⍿,nbsp:⎵')
vim.cmd.set('list')

vim.cmd.set('nocursorline')

vim.cmd.set('cindent')
vim.cmd.set('ignorecase')
vim.cmd.set('smartcase')

vim.cmd.set('nowrap')

-- latte
vim.cmd.au('BufRead,BufNewFile *.latte set filetype=html')
