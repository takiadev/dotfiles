local TO = require("my-config.textobjects")
local to = TO.textobjects()

return {
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
    {-- Configure keymap
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
          -- Default keys set by LazyVim
          -- { "<leader>fe", function() require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() }) end, desc = "Explorer NeoTree (Root Dir)", },
          -- { "<leader>fE", function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() }) end, desc = "Explorer NeoTree (cwd)", },
          -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
          -- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
          -- { "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, desc = "Git Explorer", },
          -- { "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, desc = "Buffer Explorer", },
        },
        opts = {
          -- see `:h neo-tree-custom-commands-global`
          use_default_mappings = false,
          commands = {
            copy_path_to_clipboard = function(state)
              local node = state.tree:get_node()
              local path = node.path
              vim.fn.setreg("+", path, "c")
            end,
            open_with_system_application = function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
          }, -- A list of functions
          window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
            mapping_options = { noremap = true, nowait = true },
            mappings = {
              ["<2-LeftMouse>"] = "open",
              ["<esc>"] = "cancel", -- close preview or floating neo-tree window
              ["q"] = "close_window",
              ["w"] = "prev_source",
              ["f"] = "move_cursor_up",
              ["p"] = "next_source",
              ["a"] = { "add", config = { show_path = "relative" } },
              
              -- TODO: add this: -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Tips#navigation-with-hjkl
              ["r"] = "close_node",
              ['R'] = "navigate_up",
              ["t"] = "open",
              ["<right>"] = "open",
              ["<left>"] = "close_node",
              
              ["f"] = "nop", -- set via autocmd
              ["s"] = "nop", -- set via autocmd
    
              ["T"] = { "open_tabnew", config = { expand_nested_files = false } },
              ["d"] = "delete",
              -- ['h'] = "toggle_hidden",
              ["n"] = "rename",
              ["i"] = "show_file_details",
              ["b"] = "open_with_system_application", -- b because seldom used
              ["x"] = "cut_to_clipboard",
              ["c"] = "copy_to_clipboard",
              ["C"] = "copy_path_to_clipboard",
              ["v"] = "paste_from_clipboard",
              ["g"] = { "toggle_preview", config = { use_float = false } },
              ["G"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
              ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
              -- ['.'] = "set_root",
              ["?"] = "show_help",
              ["<tab>"] = { "toggle_node", nowait = true },
              ["z"] = "close_all_nodes",
              ["Z"] = "expand_all_nodes",
              ["<space>"] = "noop", -- space is our leader we want to keep it free
              ["l"] = "noop",
              -- ["e"] = "open_split", -- e is down in nuei navigation
              -- ["i"] = "open_vsplit", -- i is right in nuei navigation
              ["e"] = "split_with_window_picker", -- e = down [neui navigation]
              ["i"] = "vsplit_with_window_picker", -- i = left [neui navigation]
              ["<cr>"] = "open_with_window_picker",
    
              -- ['<C-f>'] = "noop", -- { "scroll_preview", config = { direction = -10 } },
              -- ['<C-b>'] = "noop", -- { "scroll_preview", config = { direction = 10 } },
              -- ['<LeftRelease>'] = "noop", -- "open",
              -- ['l'] = "focus_preview",
              -- ['S'] = "open_split",
              -- ['s'] = "open_vsplit",
              -- ['sr'] = "open_rightbelow_vs",
              -- ['sl'] = "open_leftabove_vs",
              -- ['t'] = "noop", -- "open_tabnew",
              -- ['<cr>'] = "open_drop",
              -- ['t'] = "open_tab_drop",
              -- ['C'] = "noop", -- "close_node",
              -- ['z'] = "noop", -- "close_all_nodes",
              --['Z'] = "expand_all_nodes",
              -- ['R'] = "noop", -- "refresh",
              -- ['A'] = "noop", -- "add_directory", -- also accepts the config.show_path and config.insert_as options.
              -- ['r'] = "noop", -- "rename",
              -- ['c'] = "noop", -- "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
              -- ['e'] = "noop", -- "toggle_auto_expand_width",
              -- ['<'] = "noop", -- "prev_source",
              -- ['>'] = "noop", -- "next_source",
            },
          },
          filesystem = {
            window = {
              mappings = {
                ["R"] = "navigate_up",
                ["h"] = "toggle_hidden",
                ["."] = "set_root",
                ["s"] = "nop", -- see autocmd
                ["f"] = "nop", -- see autocmd
              },
              other = {
                ["H"] = "noop", -- "toggle_hidden",
                ["<bs>"] = "noop", -- "navigate_up",
                ["."] = "noop", -- "set_root",
    
                -- ["r"] = "noop", -- "noop", -- left
                -- ["t"] = "open", -- "focus_preview", -- right
                ["/"] = "noop", -- "fuzzy_finder",
                ["D"] = "noop", -- "fuzzy_finder_directory",
                --['/'] = "noop", -- "filter_as_you_type", -- this was the default until v1.28
                ["#"] = "noop", -- "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ['D'] = "noop", -- "fuzzy_sorter_directory",
                --['f'] = "noop", -- "filter_on_submit",
                ["<C-x>"] = "noop", -- "clear_filter",
                ["[g"] = "noop", -- "prev_git_modified",
                ["]g"] = "noop", -- "next_git_modified",
                ["i"] = "noop", -- "show_file_details",
                ["o"] = "noop", -- { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                ["oc"] = "noop", -- { "order_by_created", nowait = false },
                ["od"] = "noop", -- { "order_by_diagnostics", nowait = false },
                ["og"] = "noop", -- { "order_by_git_status", nowait = false },
                ["om"] = "noop", -- { "order_by_modified", nowait = false },
                ["on"] = "noop", -- { "order_by_name", nowait = false },
                ["os"] = "noop", -- { "order_by_size", nowait = false },
                ["ot"] = "noop", -- { "order_by_type", nowait = false },
                --]]
              },
              fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "noop", -- "move_cursor_down",
                ["<C-n>"] = "noop", -- "move_cursor_down",
                ["<up>"] = "noop", -- "move_cursor_up",
                ["<C-p>"] = "noop", -- "move_cursor_up",
              },
            },
          },
          buffers = {
            window = {
              mappings = {},
              other = {
                ["R"] = "navigate_up",
                ["."] = "set_root",
    
                -- ['h'] = "toggle_hidden",
                ["<bs>"] = "noop", -- "navigate_up",
                ["."] = "noop", -- "set_root",
                ["bd"] = "noop", -- "buffer_delete",
                ["o"] = "noop", -- { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                ["oc"] = "noop", -- { "order_by_created", nowait = false },
                ["od"] = "noop", -- { "order_by_diagnostics", nowait = false },
                ["om"] = "noop", -- { "order_by_modified", nowait = false },
                ["on"] = "noop", -- { "order_by_name", nowait = false },
                ["os"] = "noop", -- { "order_by_size", nowait = false },
                ["ot"] = "noop", -- { "order_by_type", nowait = false },
              },
            },
          },
          git_status = {
            window = {
              mappings = {},
              other = {
                ["A"] = "noop", -- "git_add_all",
                ["gu"] = "noop", -- "git_unstage_file",
                ["ga"] = "noop", -- "git_add_file",
                ["gr"] = "noop", -- "git_revert_file",
                ["gc"] = "noop", -- "git_commit",
                ["gp"] = "noop", -- "git_push",
                ["gg"] = "noop", -- "git_commit_and_push",
                ["i"] = "noop", -- "show_file_details",
                ["o"] = "noop", -- { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                ["oc"] = "noop", -- { "order_by_created", nowait = false },
                ["od"] = "noop", -- { "order_by_diagnostics", nowait = false },
                ["om"] = "noop", -- { "order_by_modified", nowait = false },
                ["on"] = "noop", -- { "order_by_name", nowait = false },
                ["os"] = "noop", -- { "order_by_size", nowait = false },
                ["ot"] = "noop", -- { "order_by_type", nowait = false },
              },
            },
          },
          document_symbols = {
            window = {
              mappings = {},
            },
          },
        },
    },
}