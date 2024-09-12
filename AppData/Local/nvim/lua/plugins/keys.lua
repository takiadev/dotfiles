-- configuration for plugins included with LazyVim
-- https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-customizing-plugin-specs



local Mappings = require('my-config.keymaps')
local m = Mappings.get

-- use:
-- keys = {...} to add new keys
-- keys = function() ... to overwrite all keys

return {
{
    "folke/flash.nvim", -- https://www.lazyvim.org/plugins/editor#flashnvim
    keys = function() return {
        {m('flash-t').src, mode=m('flash-t').mode},
        --{ m('flash-f').src, mode=m('flash-f').mode, nil, desc="Find char"},
        --{ m('flash-F').src, mode=m('flash-f').mode, nil, desc="rFind char"},
        --{ m('flash-t').src, mode=m('flash-f').mode, nil, desc="Till char"},
        --{ m('flash-T').src, mode=m('flash-f').mode, nil, desc="rTill  char"},
        --{ m('flash-;').src, mode=m('flash-f').mode, nil, desc="Next"},
        --{ m('flash-,').src, mode=m('flash-f').mode, nil, desc="Prev"},
        { m('flash-jump').src, 
            mode = m('flash-jump').mode, 
            function() require("flash").jump() end, 
            desc = "Flash"
        },
        { m('flash-treesitter-search').src, 
            mode = m('flash-treesitter-search').mode, 
            function() require("flash").treesitter_search() end, 
            desc = "Treesitter Search"
        },
        { m('flash-treesitter').src, 
            mode = m('flash-treesitter').mode, 
            function() require("flash").treesitter() end, desc = "Flash Treesitter"
        },
    } end,
    opts = { modes = { char = {
        enabled=true,
        keys = {
            ["f"] = 't', -- ('flash-f').src, -- m('flash-f').src, 
            ["F"] = 'T', -- m('flash-F').src,
            ["t"] = m('flash-t').src,
            ["T"] = 'B', -- m('flash-T').src,
            [";"] = ';', -- m('flash-;').src, 
            [","] = ',', -- m('flash-,').src,
        },
        label = { exclude = "hjkliardc" },
    }}}
},
{
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        -- { "<leader>fe", function() require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() }) end, desc = "Explorer NeoTree (Root Dir)", },
        -- { "<leader>fE", function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() }) end, desc = "Explorer NeoTree (cwd)", },
        -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
        -- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
        -- { "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, desc = "Git Explorer", },
        -- { "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, desc = "Buffer Explorer", },
    },
    opts = { window = { mappings = {
        ["<2-LeftMouse>"] = "open",
        ["i"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
            function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
        },
        ["O"] = {
            function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
    }}},
}
}

----------------------------------------------------
-- EXAMPLES BELOW:

--[[ -- disable trouble plugin
    { "folke/trouble.nvim", enabled = false },
--]]

--[[ -- merge new keymaps with default ones
    return {
        "nvim-telescope/telescope.nvim",
        keys = {
          -- disable the keymap to grep files
          {"<leader>/", false},
          -- change a keymap
          { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
          -- add a keymap to browse plugin files
          {
            "<leader>fp",
            function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
            desc = "Find Plugin File",
          },
        },
    }, 
--]]

--[[ -- replace all Telescope keymaps with only one mapping
    {
        "nvim-telescope/telescope.nvim",
        keys = function()
        return {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        }
        end,
    },
--]]

--[[ -- disable the default flash keymap
    {
        "folke/flash.nvim",
        keys = {
        { "s", mode = { "n", "x", "o" }, false },
        },
    }
--]]