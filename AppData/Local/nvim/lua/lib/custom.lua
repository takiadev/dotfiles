local M = {}


 function M.focus_window_left_or_open_neotree()
    -- Try to move focus to the left window
    local current_win = vim.api.nvim_get_current_win()  -- Get the current window ID
    vim.cmd("wincmd h")  -- Move focus to the left window
  
    -- Check if the window ID has changed
    if current_win == vim.api.nvim_get_current_win() then
      -- No left window exists, so open Neo-tree
      vim.cmd("Neotree focus")  -- Open and focus Neo-tree
    end
end

return M