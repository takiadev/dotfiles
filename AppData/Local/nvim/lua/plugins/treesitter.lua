return 
{
    "nvim-treesitter/nvim-treesitter",
    config = function ()
    --    require ('nvim-treesitter.install').compilers = { "clang" } 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { 
            "go", "gomod",
            "python", 
            "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"
            },

            -- Enable vim-matchup plugin integration with treesitter
            -- matchup = {
            --    enable = true,
            --    include_match_words = true,
            --    -- disable = { "c", "ruby" },
            --    -- [options]
            -- },
            -- Enable text objects integration with treesitter
            textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ip"] = "@parameter.inner",
                ["ap"] = "@parameter.outer",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.outer",
                ["as"] = "@statement.outer",
                ["ia"] = "@assignment.inner",
                ["aa"] = "@assignment.outer",
                ["ir"] = "@return.inner",
                ["ar"] = "@return.outer",
                ["i/"] = "@comment.inner",
                ["a/"] = "@comment.outer",
                -- @assignment.lhs
                -- @assignment.outer
                -- @assignment.rhs
                -- @attribute.inner
                -- @attribute.outer
                -- @call.inner
                -- @call.outer
                -- @frame.inner
                -- @frame.outer
                -- @number.inner
                -- @regex.inner
                -- @regex.outer
                },
                selection_modes = { -- can also be a function
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = function(query_string, selection_mode)
                v = query_string ~= "@assignment.inner"
                return v
                end
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                ["<Space>ab"] = "@block.outer",
                ["<Space>ib"] = "@block.inner",
                ["<Space>af"] = "@function.outer",
                ["<Space>if"] = "@function.inner",
                ["<Space>ac"] = "@class.outer",
                ["<Space>ic"] = "@class.inner",
                ["<Space>al"] = "@loop.outer",
                ["<Space>il"] = "@loop.inner",
                ["<Space>ip"] = "@parameter.inner",
                ["<Space>ap"] = "@parameter.outer",
                ["<Space>ii"] = "@conditional.inner",
                ["<Space>ai"] = "@conditional.outer",
                ["<Space>as"] = "@statement.outer",
                ["<Space>ia"] = "@assignment.inner",
                ["<Space>aa"] = "@assignment.outer",
                ["<Space>ir"] = "@return.inner",
                ["<Space>ar"] = "@return.outer",
                },
                goto_next_end = {
                ["<Space>eab"] = "@block.outer",
                ["<Space>eib"] = "@block.inner",
                ["<Space>eaf"] = "@function.outer",
                ["<Space>eif"] = "@function.inner",
                ["<Space>eac"] = "@class.outer",
                ["<Space>eic"] = "@class.inner",
                ["<Space>eal"] = "@loop.outer",
                ["<Space>eil"] = "@loop.inner",
                ["<Space>eip"] = "@parameter.inner",
                ["<Space>eap"] = "@parameter.outer",
                ["<Space>eii"] = "@conditional.inner",
                ["<Space>eai"] = "@conditional.outer",
                ["<Space>eas"] = "@statement.outer",
                ["<Space>eia"] = "@assignment.inner",
                ["<Space>eaa"] = "@assignment.outer",
                ["<Space>eir"] = "@return.inner",
                ["<Space>ear"] = "@return.outer",
                },
                goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
                },
                goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
                },
                -- Below will go to either the start or the end, whichever is closer.
                -- Use if you want more granular movements
                -- Make it even more gradual by adding multiple queries and regex.
                goto_next = {
                ["]d"] = "@conditional.outer",
                },
                goto_previous = {
                ["[d"] = "@conditional.outer",
                }
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
                },
            },
        })
    end,
}