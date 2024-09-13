-- configuration for plugins included with LazyVim
-- https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-customizing-plugin-specs



local Mappings = require('my-config.keymaps')
local m = Mappings.get

-- use:
-- keys = {...} to add new keys
-- keys = function() ... to overwrite all keys

return {
{
    "nvim-treesitter/nvim-treesitter",
    keys = {
        { "gss", desc = "Increment Selection", mode = {"x", "n"}},
        { "gsr", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
        incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gss",
            node_incremental = "gsn",
            scope_incremental = "gss",
            node_decremental = "gsr",
        },
        },
        textobjects = {
        move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
        },
    },
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
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    opts.window = opts.window or {}
    opts.window.mappings = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
      ["r"] = "noop", -- left
      ["s"] = "noop", -- down
      ["f"] = "noop", -- up
      ["t"] = "focus_preview", -- right

      -- ["<LeftRelease>"] = "open",
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
      ["<space>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      -- ["<cr>"] = { "open", config = { expand_nested_files = true } }, -- expand nested file takes precedence
      ["<esc>"] = "cancel", -- close preview or floating neo-tree window
      ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
      ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
      ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
      -- ["l"] = "focus_preview",
      -- ["S"] = "open_split",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "open_vsplit",
      -- ["sr"] = "open_rightbelow_vs",
      -- ["sl"] = "open_leftabove_vs",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["R"] = "refresh",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none", -- "none", "relative", "absolute"
        },
      },
      ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
      ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
      ["e"] = "toggle_auto_expand_width",
      ["q"] = "close_window",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
    }
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.window = opts.filesystem.window or {} 
    opts.filesystem.window.mappings = {
      ["r"] = "noop", -- left
      ["s"] = "noop", -- down
      ["f"] = "noop", -- up
      ["t"] = "focus_preview", -- right

      ["H"] = "toggle_hidden",
      ["/"] = "fuzzy_finder",
      ["D"] = "fuzzy_finder_directory",
      --["/"] = "filter_as_you_type", -- this was the default until v1.28
      ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
      -- ["D"] = "fuzzy_sorter_directory",
      --["f"] = "filter_on_submit",
      ["<C-x>"] = "clear_filter",
      ["<bs>"] = "navigate_up",
      ["."] = "set_root",
      ["[g"] = "prev_git_modified",
      ["]g"] = "next_git_modified",
      ["i"] = "show_file_details",
      ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
      ["oc"] = { "order_by_created", nowait = false },
      ["od"] = { "order_by_diagnostics", nowait = false },
      ["og"] = { "order_by_git_status", nowait = false },
      ["om"] = { "order_by_modified", nowait = false },
      ["on"] = { "order_by_name", nowait = false },
      ["os"] = { "order_by_size", nowait = false },
      ["ot"] = { "order_by_type", nowait = false },
    }
    opts.filesystem.window.fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
      ["<down>"] = "move_cursor_down",
      ["<C-n>"] = "move_cursor_down",
      ["<up>"] = "move_cursor_up",
      ["<C-p>"] = "move_cursor_up",
    }
    opts.buffer = opts.buffer or {}
    opts.buffer.window = opts.buffer.window or {}
    opts.buffer.window.mappings = {
      ["<bs>"] = "navigate_up",
      ["."] = "set_root",
      ["bd"] = "buffer_delete",
      ["i"] = "show_file_details",
      ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
      ["oc"] = { "order_by_created", nowait = false },
      ["od"] = { "order_by_diagnostics", nowait = false },
      ["om"] = { "order_by_modified", nowait = false },
      ["on"] = { "order_by_name", nowait = false },
      ["os"] = { "order_by_size", nowait = false },
      ["ot"] = { "order_by_type", nowait = false },
    }
    opts.git_status = opts.git_status or {}
    opts.git_status.window = opts.git_status.window or {}
    opts.git_status.window.mappings = {
      ["A"] = "git_add_all",
      ["gu"] = "git_unstage_file",
      ["ga"] = "git_add_file",
      ["gr"] = "git_revert_file",
      ["gc"] = "git_commit",
      ["gp"] = "git_push",
      ["gg"] = "git_commit_and_push",
      ["i"] = "show_file_details",
      ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
      ["oc"] = { "order_by_created", nowait = false },
      ["od"] = { "order_by_diagnostics", nowait = false },
      ["om"] = { "order_by_modified", nowait = false },
      ["on"] = { "order_by_name", nowait = false },
      ["os"] = { "order_by_size", nowait = false },
      ["ot"] = { "order_by_type", nowait = false },
    }
    opts.document_symbols = opts.document_symbols or {}
    opts.document_symbols.window = opts.documents_synbols.window or {}
    opts.document_symbols.window.mappings = {
      ["r"] = "noop", -- left
      ["s"] = "noop", -- down
      -- ["f"] = "noop", -- up
      ["t"] = "noop", -- right

      ["<cr>"] = "jump_to_symbol",
      ["o"] = "jump_to_symbol",
      ["A"] = "noop", -- also accepts the config.show_path and config.insert_as options.
      ["d"] = "noop",
      ["y"] = "noop",
      ["x"] = "noop",
      ["p"] = "noop",
      ["c"] = "noop",
      ["m"] = "noop",
      ["a"] = "noop",
      ["/"] = "filter",
      -- ["f"] = "filter_on_submit",
    }
    if opts.example and opts.example.window then
      opts.example.window.mappings = {}
    end
    -- { ["<cr>"] = "toggle_node", ["<C-e>"] = "example_command", ["d"] = "show_debug_info", }

    return opts
  end,
},
{
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
{
    "folke/flash.nvim", -- https://www.lazyvim.org/plugins/editor#flashnvim
    labels = "arstneioufcmx,yw",
    label = {
        rainbow = {
            enabled = true,
            -- number between 1 and 9
            shade = 5,
        },
    },
    keys = function() return {
        { m('flash-f').src, mode=m('flash-f').mode},
        { m('flash-F').src, mode=m('flash-F').mode},
        { m('flash-t').src, mode=m('flash-t').mode},
        { m('flash-T').src, mode=m('flash-T').mode},
        { m('flash-;').src, mode=m('flash-;').mode},
        { m('flash-,').src, mode=m('flash-,').mode},
        { m('flash-jump').src, 
            mode = m('flash-jump').mode, 
            function() require("flash").jump() end, 
            desc = "Flash"
        },
        { m('flash-tss').src, 
            mode = m('flash-tss').mode, 
            function() require("flash").treesitter_search() end, 
            desc = "Treesitter Search"
        },
        { m('flash-ts').src, 
            mode = m('flash-ts').mode, 
            function() require("flash").treesitter() end, desc = "Flash Treesitter"
        },
    } end,
    opts = { modes = { char = {
        enabled=true,
        keys = {
            ["f"] = m('flash-f').src, 
            ["F"] = m('flash-F').src,
            ["t"] = m('flash-t').src,
            ["T"] = m('flash-T').src,
            [";"] = m('flash-;').src, 
            [","] = m('flash-,').src,
        },
        label = { exclude = "hjkliardc" },
    }}}
},
}

--[[
{
    -- labels = "abcdefghijklmnopqrstuvwxyz",
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      -- search/jump in all windows
      multi_window = true,
      -- search direction
      forward = true,
      -- when `false`, find only matches in the given direction
      wrap = true,
      ---@type Flash.Pattern.Mode
      -- Each mode will take ignorecase and smartcase into account.
      -- * exact: exact match
      -- * search: regular search
      -- * fuzzy: fuzzy search
      -- * fun(str): custom function that returns a pattern
      --   For example, to only match at the beginning of a word:
      --   mode = function(str)
      --     return "\\<" .. str
      --   end,
      mode = "exact",
      -- behave like `incsearch`
      incremental = false,
      -- Excluded filetypes and custom window filters
      ---@type (string|fun(win:window))[]
      exclude = {
        "notify",
        "cmp_menu",
        "noice",
        "flash_prompt",
        function(win)
          -- exclude non-focusable windows
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
      -- Optional trigger character that needs to be typed before
      -- a jump label can be used. It's NOT recommended to set this,
      -- unless you know what you're doing
      trigger = "",
      -- max pattern length. If the pattern length is equal to this
      -- labels will no longer be skipped. When it exceeds this length
      -- it will either end in a jump or terminate the search
      max_length = false, ---@type number|false
    },
    jump = {
      -- save location in the jumplist
      jumplist = true,
      -- jump position
      pos = "start", ---@type "start" | "end" | "range"
      -- add pattern to search history
      history = false,
      -- add pattern to search register
      register = false,
      -- clear highlight after jump
      nohlsearch = false,
      -- automatically jump when there is only one match
      autojump = false,
      -- You can force inclusive/exclusive jumps by setting the
      -- `inclusive` option. By default it will be automatically
      -- set based on the mode.
      inclusive = nil, ---@type boolean?
      -- jump position offset. Not used for range jumps.
      -- 0: default
      -- 1: when pos == "end" and pos < current position
      offset = nil, ---@type number
    },
    label = {
      -- allow uppercase labels
      uppercase = true,
      -- add any labels with the correct case here, that you want to exclude
      exclude = "",
      -- add a label for the first match in the current window.
      -- you can always jump to the first match with `<CR>`
      current = true,
      -- show the label after the match
      after = true, ---@type boolean|number[]
      -- show the label before the match
      before = false, ---@type boolean|number[]
      -- position of the label extmark
      style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
      -- flash tries to re-use labels that were already assigned to a position,
      -- when typing more characters. By default only lower-case labels are re-used.
      reuse = "lowercase", ---@type "lowercase" | "all" | "none"
      -- for the current window, label targets closer to the cursor first
      distance = true,
      -- minimum pattern length to show labels
      -- Ignored for custom labelers.
      min_pattern_length = 0,
      -- Enable this to use rainbow colors to highlight labels
      -- Can be useful for visualizing Treesitter ranges.
      rainbow = {
        enabled = false,
        -- number between 1 and 9
        shade = 5,
      },
      -- With `format`, you can change how the label is rendered.
      -- Should return a list of `[text, highlight]` tuples.
      ---@class Flash.Format
      ---@field state Flash.State
      ---@field match Flash.Match
      ---@field hl_group string
      ---@field after boolean
      ---@type fun(opts:Flash.Format): string[][]
      format = function(opts)
        return { { opts.match.label, opts.hl_group } }
      end,
    },
    highlight = {
      -- show a backdrop with hl FlashBackdrop
      backdrop = true,
      -- Highlight the search matches
      matches = true,
      -- extmark priority
      priority = 5000,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
    -- action to perform when picking a label.
    -- defaults to the jumping logic depending on the mode.
    ---@type fun(match:Flash.Match, state:Flash.State)|nil
    action = nil,
    -- initial pattern to use when opening flash
    pattern = "",
    -- When `true`, flash will try to continue the last search
    continue = false,
    -- Set config to a function to dynamically change the config
    config = nil, ---@type fun(opts:Flash.Config)|nil
    -- You can override the default options for a specific mode.
    -- Use it with `require("flash").jump({mode = "forward"})`
    ---@type table<string, Flash.Config>
    modes = {
      -- options used when flash is activated through
      -- a regular search with `/` or `?`
      search = {
        -- when `true`, flash will be activated during regular search by default.
        -- You can always toggle when searching with `require("flash").toggle()`
        enabled = false,
        highlight = { backdrop = false },
        jump = { history = true, register = true, nohlsearch = true },
        search = {
          -- `forward` will be automatically set to the search direction
          -- `mode` is always set to `search`
          -- `incremental` is set to `true` when `incsearch` is enabled
        },
      },
      -- options used when flash is activated through
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        enabled = true,
        -- dynamic configuration for ftFT motions
        config = function(opts)
          -- autohide flash when in operator-pending mode
          opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")
  
          -- disable jump labels when not enabled, when using a count,
          -- or when recording/executing registers
          opts.jump_labels = opts.jump_labels
            and vim.v.count == 0
            and vim.fn.reg_executing() == ""
            and vim.fn.reg_recording() == ""
  
          -- Show jump labels only in operator-pending mode
          -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
        end,
        -- hide after jump when not using jump labels
        autohide = false,
        -- show jump labels
        jump_labels = false,
        -- set to `false` to use the current line only
        multi_line = true,
        -- When using jump labels, don't use these keys
        -- This allows using those keys directly after the motion
        label = { exclude = "hjkliardc" },
        -- by default all keymaps are enabled, but you can disable some of them,
        -- by removing them from the list.
        -- If you rather use another key, you can map them
        -- to something else, e.g., { [";"] = "L", [","] = H }
        keys = { "f", "F", "t", "T", ";", "," },
        ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
        -- The direction for `prev` and `next` is determined by the motion.
        -- `left` and `right` are always left and right.
        char_actions = function(motion)
          return {
            [";"] = "next", -- set to `right` to always go right
            [","] = "prev", -- set to `left` to always go left
            -- clever-f style
            [motion:lower()] = "next",
            [motion:upper()] = "prev",
            -- jump2d style: same case goes next, opposite case goes prev
            -- [motion] = "next",
            -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
          }
        end,
        search = { wrap = false },
        highlight = { backdrop = true },
        jump = {
          register = false,
          -- when using jump labels, set to 'true' to automatically jump
          -- or execute a motion when there is only one match
          autojump = false,
        },
      },
      -- options used for treesitter selections
      -- `require("flash").treesitter()`
      treesitter = {
        labels = "abcdefghijklmnopqrstuvwxyz",
        jump = { pos = "range", autojump = true },
        search = { incremental = false },
        label = { before = true, after = true, style = "inline" },
        highlight = {
          backdrop = false,
          matches = false,
        },
      },
      treesitter_search = {
        jump = { pos = "range" },
        search = { multi_window = true, wrap = true, incremental = false },
        remote_op = { restore = true },
        label = { before = true, after = true, style = "inline" },
      },
      -- options used for remote flash
      remote = {
        remote_op = { restore = true, motion = true },
      },
    },
    -- options for the floating window that shows the prompt,
    -- for regular jumps
    -- `require("flash").prompt()` is always available to get the prompt text
    prompt = {
      enabled = true,
      prefix = { { "⚡", "FlashPromptIcon" } },
      win_config = {
        relative = "editor",
        width = 1, -- when <=1 it's a percentage of the editor width
        height = 1,
        row = -1, -- when negative it's an offset from the bottom
        col = 0, -- when negative it's an offset from the right
        zindex = 1000,
      },
    },
    -- options for remote operator pending mode
    remote_op = {
      -- restore window views and cursor position
      -- after doing a remote operation
      restore = false,
      -- For `jump.pos = "range"`, this setting is ignored.
      -- `true`: always enter a new motion when doing a remote operation
      -- `false`: use the window's cursor position and jump target
      -- `nil`: act as `true` for remote windows, `false` for the current window
      motion = false,
    },
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