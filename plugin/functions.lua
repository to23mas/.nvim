
vim.api.nvim_create_user_command(
    "Blame",
    function() require('gitsigns').blame() end,
    {}
)

