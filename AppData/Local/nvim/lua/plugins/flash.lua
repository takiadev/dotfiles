return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keymap_actions = keymap_actions,
    keys = {
        { "p", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "P", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {},
        jump = {autojump = false}, -- automatically jump when there is only one match
        label = {
            uppercase = true,   -- allow uppercase labels
            exclude = "",       -- add any labels with the correct case here, that you want to exclude
            after = false,      -- show the label after the match
            before = true,      -- show the label before the match
            rainbow = {
                enabled = false,
                shade = 5,        -- number between 1 and 9
            },
        },
        modes = {
            search = {         -- settings for regular search /?
                enabled = true,  -- enabled by default? use `require('flash').toggle() to change
                highlight = { backdrop = false },
                jump = { history = true, register = true, nohlsearch = true },
                search = {},
            },
            char = {                -- settings for char search `f` `F` `t` `T` `;` `,`
                enabled = true,       
                autohide = false,     -- hide after jump when not using jump labels
                jump_labels = false,  -- show jump labels
                multi_line = true,    -- set to `false` to use the current line only
                label = { exclude = "hjkliardc" },  -- This allows using those keys directly after the motion
                keys = {"f", "F", ";", ","}, -- Keymaps.keys_for_flash_plugin(), -- keys = { "f", "F", "t", "T", ";", "," },
            },
            treesitter = {          -- treesitter selections
                labels = "abcdefghijklmnopqrstuvwxyz",
                jump = { pos = "range", autojump = true },
                search = { incremental = false },
                label = { before = true, after = true, style = "inline" },
                highlight = {
                backdrop = false,
                matches = false,
                },
            },
            treesitter_search = {   -- treesitter search
                jump = { pos = "range" },
                search = { multi_window = true, wrap = true, incremental = false },
                remote_op = { restore = true },
                label = { before = true, after = true, style = "inline" },
            },
        },
        prompt = {  -- options for the floating window that shows the prompt
            enabled = true,
        },
    }
}