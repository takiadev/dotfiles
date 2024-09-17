return {
{
    "folke/which-key.nvim",
    --triggers = {{ "<auto>", mode = "nxso" }},
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = true }) end,
            desc = "Keymaps (which-key)",
        },
        -- {
        --    "sc",
        --    function() require("which-key").show({ keys = "s", loop = true }) end,
        --    desc = "Motion Menu Hydra Mode",
        -- },
        {
            "<leader>S",
            function() require("which-key").show({ keys = "s", loop = false}) end,
            desc = "Motion Menu",
        },
    },
    opts = {
        spec = {
            { 
                mode = {'n', 'x', 'o'},
                {'s', group = 'Motion Menu' },
            },
        },
        sort = { "local", "order", "alphanum", "mod" },
        filter = function(mapping)
            return mapping.desc and mapping.desc ~= "" and mapping.desc ~= "<unset>"
        end,
    },
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    --[[
    opts = function (_, opts)
        opts.sort = { "local", "order", "alphanum", "mod" }
        opts.filter = function(mapping)
            return mapping.desc and mapping.desc ~= "" and mapping.desc ~= "<unset>"
        end
        opts.triggers = opts.triggers or {}
        table.insert(opts.triggers, { "s", mode = {"n", "x", "o", } })
        opts.spec = opts.spec or {}
        table.insert(opts.spec, {
            mode={"n", "x", "o"}, 
            { "s", group = "Motion Menu"},
        })
        return opts
    end,
    --]]
}
}

--[[        
    keys = {
        -- {
        --     "<leader>?",
        --     function()
        --         require("which-key").show({ global = false })
        --     end,
        --     desc = "Buffer Keymaps (which-key)",
        -- },
        -- {
        --     "<c-w><space>",
        --     function()
        --         require("which-key").show({ keys = "<c-w>", loop = true })
        --     end,
        --     desc = "Window Hydra Mode (which-key)",
        -- },
    },

    opts = {        
        spec = {
            {
                mode = { "n", "v" },
                { "<leader><tab>", group = "tabs" },
                { "<leader>c", group = "code" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "git" },
                { "<leader>gh", group = "hunks" },
                { "<leader>q", group = "quit/session" },
                { "<leader>s", group = "search" },
                { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
                { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
                { "[", group = "prev" },
                { "]", group = "next" },
                { "g", group = "goto" },
                { "gs", group = "surround" },
                { "z", group = "fold" },
                {
                    "<leader>b",
                    group = "buffer",
                    expand = function()
                        return require("which-key.extras").expand.buf()
                    end,
                },
                {
                    "<leader>w",
                    group = "windows",
                    proxy = "<c-w>",
                    expand = function()
                        return require("which-key.extras").expand.win()
                    end,
                },
                -- better descriptions
                { "gx", desc = "Open with system app" },
            },
            },
        }
--]]