-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- SYNCHRONIZE COLORSCHEME WITH WEZTERM
-- https://www.reddit.com/r/neovim/comments/19bb3e1/consistent_neovimwezterm_colorscheme/

-- Auto Open Neotree on start
-- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- desc = "Open neo-tree on enter",
-- group = "neotree_autoopen",
-- callback = function()
--  if not vim.g.neotree_opened then
--    vim.cmd "Neotree show"
--    vim.g.neotree_opened = true
--  end
-- end,
-- })

-- Remap z key with nowait modifier
--[[
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*",
    callback = function(args)
      vim.keymap.set({'n'}, 'z', 'u', { buffer = args.buf, nowait=true, noremap=true })
    end
  })
--]]

-- Enable f/s navigation in neo-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    -- Map 's' to <Down> in the current buffer
    vim.api.nvim_buf_set_keymap(0, 'n', 'f', '<Up>', { noremap = true, silent = true, nowait = true, })
    vim.api.nvim_buf_set_keymap(0, 'n', 's', '<Down>', { noremap = true, silent = true, nowait = true, })
  end,
})
 
--[[
-- Autocommand to hide inlay hints on entering Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
  end,
})

-- Autocommand to show inlay hints on leaving Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
  end,
})
--]]