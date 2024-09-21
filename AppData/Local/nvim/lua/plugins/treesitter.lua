local TO = require("my-config.textobjects")
local to = TO.textobjects()

return {
    {
        "nvim-treesitter/nvim-treesitter",
        keys = {},
        opts = {
          incremental_selection = {
            enable = false, -- we don't need this because flash.treesitter is better
            keymaps = {
              init_selection = "gss",
              node_incremental = "gsn",
              scope_incremental = "gss",
              node_decremental = "gsr",
            },
          },
          textobjects = {}, -- to.treesitter_textobjects(),
        },
      },
}