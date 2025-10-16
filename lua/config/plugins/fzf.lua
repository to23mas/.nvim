-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
return {{
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymap = {
            fzf = {
                ["down"] = "next-history",
                ["up"]   = "prev-history",
                ["ctrl-p"] = "up",   -- move selection up
                ["ctrl-n"] = "down", -- move selection down
            },
        },
        fzf_opts = {
            ['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history',
        }
    },
    config = function(_, opts)
      local fzf = require("fzf-lua")
      fzf.setup(opts)

      local ivy_layout = {
          height = 0.45,
          width = 1,
          row = 1,
          col = 0,
          border = 'none',
      }

      local k = vim.keymap

      k.set("n", '<leader>P', "<cmd>FzfLua<cr>", {desc="Fzf"})
      k.set("n", "<leader>ph", fzf.help_tags, { desc = "Fzf Help Tags" })
      k.set('n', '<leader>gf', fzf.git_files, { desc = "Git files" })
      k.set("n", "<leader>pb", fzf.buffers, { desc = "Fzf Buffers" })

      k.set("n", "<leader>pf", fzf.files, { desc = "Fzf Files" })
      k.set("n", "<leader>pF", function()
          fzf.files({
              git_ignore = false,
              hidden = true,
              no_ignore = true,
              no_ignore_parent = true
          })
      end, { desc = "Fzf All Files" })

      k.set("n", "<leader>ps", function()
          fzf.live_grep({
              winopts = ivy_layout,
          })
      end, { desc = "Fzf Live Grep" })

      k.set("n", "<leader>pS", function()
          fzf.live_grep({
              git_ignore = false,
              hidden = true,
              no_ignore = true,
              no_ignore_parent = true,
              winopts = ivy_layout,
          })
      end, { desc = "FzfLua: grep All" })

      k.set("n", "gr", fzf.lsp_references, { desc = "Goto References" })
      k.set("n", "<leader>ds", fzf.lsp_document_symbols, { desc = "Document Symbols" })
      k.set("n", "<leader>ws", fzf.lsp_workspace_symbols, { desc = "Workspace Symbols" })

    end,
}}
