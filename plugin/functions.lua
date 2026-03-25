---@class UserCommandOpts
---@field keys string
---@field mode string
---@field desc string

---@param name string
---@param fn function
---@param keymap_opts? UserCommandOpts
local function create_custom_user_comand(name, fn, keymap_opts)
    vim.api.nvim_create_user_command(name, function() fn() end, {})

    if keymap_opts then
        vim.keymap.set(keymap_opts.mode, keymap_opts.keys, fn, { desc = keymap_opts.desc })
    end
end


create_custom_user_comand(
    "Blame",
    function() require('gitsigns').blame() end,
    nil
)

create_custom_user_comand(
    "Review",
    function()
        local signs = require('gitsigns')

        signs.toggle_linehl()
        signs.toggle_deleted()
    end,
    {
        mode = 'n',
        keys = '<leader>gr',
        desc = 'review mode',
    }
);


create_custom_user_comand(
    "CopyFile",
    function()
        local filename = vim.fn.expand('%')
        vim.fn.setreg('+', filename)
        vim.notify(filename)
    end,
    {
        mode = 'n',
        keys = '<leader>fa',
        desc = 'Copy current file content to clipboard',
    }
)
