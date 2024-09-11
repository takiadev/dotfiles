return {
    "folke/persistence.nvim",
    keymap_actions = m,
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
      { "wsl", function() require("persistence").load() end, desc = "Restore Session" },
      { "wss", function() require("persistence").select() end,desc = "Select Session" },
      { "wsr", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "wsx", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
    config=function()
        local wk = require("which-key")
        wk.add({"ws", group="Session", mode='n'})
    end,
}