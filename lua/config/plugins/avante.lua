-- https://github.com/yetone/avante.nvim
return { {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        -- add any opts here
        -- this file can contain specific instructions for your project
        instructions_file = "avante.md",
        -- for example
        provider = "copilot",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "Avante" },
            },
            ft = { "Avante" },
        },
    },
    -- config = function()
    --   local opts = { provider = "copilot" }
    --
    --   local openai_api_url = os.getenv("OPENAI_API_CHAT_COMPLETIONS")
    --   if openai_api_url then
    --     opts.provider = "openai"
    --     opts.openai = {
    --       endpoint = openai_api_url,
    --       model = "anthropic:claude-3-5-sonnet",
    --       timeout = 30000,
    --       temperature = 0,
    --       max_tokens = 4096,
    --       ["local"] = false,
    --     }
    --   end
    --
    --   require("avante").setup(opts)
    -- end,
}}
