return 
{
    {-- Enable file nesting in neo-tree
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            -- Others dependencies
            'saifulapm/neotree-file-nesting-config', -- add plugin as dependency. no need any other config or setup call
        },
        opts = function (_, opts)
            opts.nesting_rules = require('neotree-file-nesting-config').nesting_rules
            return opts
        end
    },
    {-- Display source selector
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            --hide_root_node = true,
            --retain_hidden_root_indent = true,
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
                winbar = true,  -- Enable tabs in the winbar
                statusline = false,  -- You can switch this to true if you prefer tabs in the statusline
                content_layout = "center",  -- Center the tabs in the winbar
                tabs_layout = "equal",  -- Each tab has equal width
                show_scrolled_off_parent_node = true, -- Option to display scrolled off parent node
                -- separator_active = "▎",  -- Customize active tab separator
                highlight_tab = "NeoTreeTabInactive",  -- Highlight for inactive tabs
                highlight_tab_active = "NeoTreeTabActive",  -- Highlight for active tabs
            },
        }
    },
    -- Bufferline configuration with tabline integration for the Neo-tree source selector
    {
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

}
  