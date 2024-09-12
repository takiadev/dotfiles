-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- SYNCHRONIZE COLORSCHEME WITH WEZTERM
-- https://www.reddit.com/r/neovim/comments/19bb3e1/consistent_neovimwezterm_colorscheme/

--[[
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*",
    callback = function(args)
      vim.keymap.set({'n'}, 'z', 'u', { buffer = args.buf, nowait=true, noremap=true })
    end
  })
--]]