local gs = require("gitsigns")

vim.keymap.set("n", "<leader>gsbl", function() gs.toggle_current_line_blame() end)
vim.keymap.set("n", "<leader>gsm", function() gs.toggle_quick_menu() end)
