-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
------------------------------------------------------

-- local keymaps = require("my-config.keymaps")
-- keymaps.register_mappings()

local keymaps = require("my-config.keys")
keymaps.setup_keymaps()
