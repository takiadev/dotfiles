return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
    },
    opts = {
        --debug = true,
        preset = "helix", -- "modern", -- "helix"
        notify = true,
        sort = { "local", "order", "alphanum", "mod" },
        filter = function(mapping)
            return mapping.desc and mapping.desc ~= ""
        end,
        --expand = function(node)
        --    return not node.desc -- expand all nodes without a description
        --end,
        defer = function(ctx)
            return false -- ctx.mode == "V" or ctx.mode == "<C-V>"
        end,
        plugins = {
            presets = {
                operators = false, -- adds help for operators like d, y, ...
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = false, -- bindings for folds, spelling and others prefixed with z
                g = false, -- bindings for prefixed with g
            },
        },
        icons = {
            rules = {
                { pattern = "precede", icon = " ", color = "green" },
            },
        },
    },
}