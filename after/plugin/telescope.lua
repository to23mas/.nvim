local builtin = require('telescope.builtin')

vim.keymap.set('n','<leader>fr', '<cmd>Telescope oldfiles<cr>', {desc='open [r]ecent file' })

vim.keymap.set('n', '<leader>gb', function () builtin.git_branches() end, {desc= "[g]it branches" })
vim.keymap.set('n', '<leader>gf', function () builtin.git_files() end, {desc= "[g]it files" })
vim.keymap.set('n', '<leader>gd', function () builtin.git_files() end, {desc= "[d]iagnostics" })
vim.keymap.set('n', '<leader>gs', function () builtin.git_files() end, {desc= "git [s]tatus" })

vim.keymap.set('n', '<leader>pf', function () builtin.find_files() end, {desc= "[f]ind files" })
vim.keymap.set('n', '<leader>pF', function () builtin.find_files({ hidden=true, no_ignore=true }) end, {desc= "[F]ind all files" })
vim.keymap.set('n', '<leader>ps', function () builtin.grep_string({ search = vim.fn.input("Grep >") }) end, {desc= "[S]search string / grep" })
vim.keymap.set('n', '<leader>pS', function () builtin.grep_string({ hidden=true, no_ignore=true, search=vim.fn.input("Grep >") }) end, {desc= "[s]search string / grep everywhere" })
vim.keymap.set('n', '<leader>pw', function () builtin.grep_string() end, {desc= "search word" })
vim.keymap.set('n', '<leader>pb', function () builtin.buffers() end, {desc= "search [b]uffers" })
vim.keymap.set('n', '<leader>ph', function () builtin.help_tags() end, {desc= "[h]elp search" })
vim.keymap.set('n', '<leader>pm', function () builtin.marks() end, {desc= "marks" })
