return {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<A-p>", false }
      keys[#keys + 1] = { "<A-n>", false }
    end,
  }