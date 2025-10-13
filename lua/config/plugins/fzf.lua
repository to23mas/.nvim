-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
return {{
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function(_, opts)
      local fzf = require("fzf-lua")
      fzf.setup(opts)

      local k = vim.keymap

      k.set("n", '<leader>P', "<cmd>FzfLua<cr>", {desc="Fzf"})
      k.set("n", "<leader>pf", fzf.files, { desc = "Fzf Files" })
      k.set("n", "<leader>ps", fzf.grep, { desc = "Fzf Grep" })
      k.set("n", "<leader>pS", fzf.live_grep, { desc = "Fzf Live Grep" })
      k.set("n", "<leader>pb", fzf.buffers, { desc = "Fzf Buffers" })
      k.set("n", "<leader>ph", fzf.help_tags, { desc = "Fzf Help Tags" })
      k.set('n', '<leader>gf', fzf.git_files, { desc = "[g]it files" })
      k.set("n", "<leader>pa", function()
          fzf.files({ git_ignore = false })
      end, { desc = "Fzf All Files" })

      k.set("n", "gr", fzf.lsp_references, { desc = "Goto References" })
      k.set("n", "<leader>ds", fzf.lsp_document_symbols, { desc = "Document Symbols" })
      k.set("n", "<leader>ws", fzf.lsp_workspace_symbols, { desc = "Workspace Symbols" })

    end,
}}
