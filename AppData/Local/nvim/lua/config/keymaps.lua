-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
------------------------------------------------------

-- local keymaps = require("my-config.keymaps")
-- keymaps.register_mappings()

local keymaps = require("my-config.keys")
keymaps.setup_keymaps()

local resize = require('lib.resize_window')

-- Bindings for growing and shrinking window edges
local Window = require('lib.resize_window')
vim.keymap.set('n', '<C-Right>', Window.shrink_left_edge, { noremap = true, silent = true })  -- Shrink left
vim.keymap.set('n', '<C-Left>', Window.grow_left_edge, { noremap = true, silent = true })       -- Grow left
vim.keymap.set('n', '<C-S-Left>', Window.shrink_right_edge, { noremap = true, silent = true })  -- Shrink right
vim.keymap.set('n', '<C-S-Right>', Window.grow_right_edge, { noremap = true, silent = true })     -- Grow right
vim.keymap.set('n', '<C-Down>', Window.shrink_top_edge, { noremap = true, silent = true })    -- Shrink top
vim.keymap.set('n', '<C-Up>', Window.grow_top_edge, { noremap = true, silent = true })          -- Grow top
vim.keymap.set('n', '<C-S-Up>', Window.shrink_bottom_edge, { noremap = true, silent = true })   -- Shrink bottom
vim.keymap.set('n', '<C-S-Down>', Window.grow_bottom_edge, { noremap = true, silent = true })     -- Grow bottom




-- vim.keymap.set('n', 'l', open_node, { noremap = true, silent = true })

-- TODO migrate to keys
-- Add ctrl+tab to switch buffer
-- move bindings 
-- CODE:
---- go to def
---- go to impl
---- rename symbol
---- switch back & forth with terminal
-- quick open file
-- all git
-- test coverage

-- multiple cursors?