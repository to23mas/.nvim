-- -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

vim.opt.showmode = false
-- stops moving text on error
vim.opt.signcolumn = 'yes:1'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '⍿', nbsp = '⎵' }

vim.opt.cursorline = true
--vim.cmd.set('cindent')
vim.opt.cindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd.set('nowrap')

-- latte
vim.cmd.au('BufRead,BufNewFile *.latte set filetype=html')
