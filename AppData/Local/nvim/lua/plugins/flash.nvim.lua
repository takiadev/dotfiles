return {
    {
        "folke/flash.nvim", -- https://www.lazyvim.org/plugins/editor#flashnvim
        labels = "baqwrfsptcxlnueyi;om,",
        keys = function()
          return {
            {
              "<Plug>flash.jump",
              mode = {'n', 'x', 'o'},
              function()
                require("flash").jump()
              end,
              desc = "Flash",
            },
            {
              "<Plug>flash.jump_till",
              mode = {'n', 'x', 'o'},
              function()
                require("flash").jump({jump={inclusive=false}}) -- jump.inclusive=false
              end,
              desc = "Flash",
            },
            {
              "<Plug>flash.tss",
              mode = {'n', 'x', 'o'},
              function()
                require("flash").treesitter_search()
              end,
              desc = "Treesitter Search",
            },
            {
              "<Plug>flash.ts",
              mode = {'n', 'x', 'o'},
              function()
                require("flash").treesitter()
              end,
              desc = "Flash Treesitter",
            },
            {
              "<Plug>flash.line",
              mode = {'n', 'x', 'o'},
              function()
                require("flash").jump({
                  labels="baqwrfsptcxlnueyi;om,",
                  search = { mode = "search", max_length = 0 },
                  label = { after = { 0, 0 } },
                  pattern = "^"
                })
              end,
              desc = "Flash jump to line",
            }
          }
        end,
        opts = {
          modes = {
            search = { enabled = false },
            char = {
              enabled = true,
              jump_labels = false,
              highlight = { backdrop = false },
              keys = {
                ["f"] = "<Plug>flash.f",
                ["F"] = "<Plug>flash.F",
                ["t"] = "<Plug>flash.t",
                ["T"] = "<Plug>flash.T",
                [";"] = "<Plug>flash.;",
                [","] = "<Plug>flash.,",
              },
              -- label = { exclude = "hjkliardc" },
              char_actions = function(motion)
                return {
                  [";"] = "right", -- set to `right` to always go right
                  [","] = "left", -- set to `left` to always go left
                  -- clever-f style
                  -- [motion:lower()] = "next",
                  -- [motion:upper()] = "prev",
                  -- jump2d style: same case goes next, opposite case goes prev
                  [motion] = "next",
                  [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
                }
              end,
            },
            treesitter_search = { label = { rainbow = { enabled = false, shade = 2 } } },
          },
        },
    },
}