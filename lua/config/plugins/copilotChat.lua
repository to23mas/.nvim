-- https://github.com/github/copilot.vim
return {{
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            show_help = true, -- Show help text for CopilotChatInPlace
        },
        keys = {
            { "<leader>ao", "<cmd>CopilotChatToggle<cr>", desc = "open/close chat" },
            { "<leader>as", "<cmd>CopilotChatStop<cr>", desc = "stop output" },
            { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "review chat" },
            { "<leader>av", "<cmd>CopilotChatSave<cr>", desc = "save chat" },
            { "<leader>al", "<cmd>CopilotChatLoad<cr>", desc = "load chat" },
            { "<leader>ap", "<cmd>CopilotChatPrompts<cr>", desc = "prompts" },
            { "<leader>am", "<cmd>CopilotChatModels<cr>", desc = "models" },
    },
}}
