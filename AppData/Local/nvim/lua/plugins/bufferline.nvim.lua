return {
    {-- Bufferline configuration with tabline integration for the Neo-tree source selector
        "akinsho/bufferline.nvim",
        lazy = false, -- Load during startup to ensure the tabline is available
        opts = {
            options = {
                offsets = {
                  {
                    filetype = "neo-tree",
                    text = "  Sidebar"
                  },
                },
            },
        }
    },
    {-- Bufferline keymap
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
          --{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
          --{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
          --{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
          --{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
          --{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
          { "<S-h>", false },
          { "<S-l>", false },
          --{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
          --{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
          --{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
          --{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
        },
    },
}