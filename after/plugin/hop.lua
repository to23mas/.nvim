require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set('n', '<leader>jl', "<cmd>HopLine<cr>", {desc="jump to [l]ine" })
vim.keymap.set('n', '<leader>jw', "<cmd>HopWord<cr>", {desc="jump to [w]ord" })
vim.keymap.set('n', '<leader>jc', "<cmd>HopChar1<cr>", {desc="jump to [c]haracter 1" })
vim.keymap.set('n', '<leader>jC', "<cmd>HopChar2<cr>", {desc="jump to [C]haracter 2" })

vim.keymap.set('n', '<leader>jjl', "<cmd>HopLineMW<cr>", {desc="jump to line" })
vim.keymap.set('n', '<leader>jjw', "<cmd>HopWordMW<cr>", {desc="jump to word" })
vim.keymap.set('n', '<leader>jjc', "<cmd>HopChar1MW<cr>", {desc="jump to character 1" })
vim.keymap.set('n', '<leader>jjC', "<cmd>HopChar2MW<cr>", {desc="jump to character 2" })

