return {
    {
        "andymass/vim-matchup",
        event = "BufReadPost",
        version = false,
        
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
            vim.g.matchup_matchparen_deferred = 1
            vim.g.matchup_matchparen_hi_surround_always = 1
            vim.g.matchup_surround_enabled = 1
            vim.g.matchup_matchparen_deferred_show_delay = 50 -- default 50ms
            vim.g.matchup_matchparen_deferred_hide_delay = 700 -- default 700ms
            vim.g.matchup_motion_override_Npercent = 100
            -- vim.g.matchup_text_obj_linewise_operators = ['d', 'y']
          -- vim.g.matchup_matchparen_offscreen = { method = nil }
          -- vim.g.matchup_matchpref = { html = { nolists = 1 } }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts_extend = { "ensure_installed" },
        opts = {
            matchup = {
                enable = true,              -- mandatory, false will disable the whole extension
                enable_quotes = true,
                -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
                include_match_words = true, -- also use regex to highlight pairs like /* */ that are not detected in treesitter
            },
        },
    },
}