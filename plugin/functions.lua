vim.api.nvim_create_user_command(
    "Blame",
    function() require('gitsigns').blame() end,
    {}
)

vim.api.nvim_create_user_command(
    "CopyFile",
    function()
        local content = vim.fn.getreg('%')
        vim.fn.setreg('+', content)
    end,
    {}
)
vim.keymap.set('n', '<leader>fa', ':CopyFile<CR>', { desc = 'Copy current file content to clipboard' })
