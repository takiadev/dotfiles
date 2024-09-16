-- This file released under MIT License
-- Copyright (c) 2024 https://takia.dev

local M = {}

-- Constants for default resize amounts
DEFAULT_VERTICAL_RESIZE_AMOUNT = 2   -- Default for vertical resizing (up and down)
DEFAULT_HORIZONTAL_RESIZE_AMOUNT = 2 -- Default for horizontal resizing (left and right)

local function is_normal_window(win_id)
    local config = vim.api.nvim_win_get_config(win_id)
    return not config.relative or config.relative == ""
end

function M.grow_left_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_HORIZONTAL_RESIZE_AMOUNT
    local left_nr = vim.fn.winnr('h')
    local left_win = vim.fn.win_getid(left_nr)

    if left_nr ~= vim.fn.winnr() and is_normal_window(left_win) then
        vim.api.nvim_win_call(left_win, function()
            vim.cmd('vertical resize -' .. resize_amount)
        end)
    else
        vim.notify("Cannot grow the left edge", vim.log.levels.INFO)
    end
end
function M.shrink_left_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_HORIZONTAL_RESIZE_AMOUNT
    local left_nr = vim.fn.winnr('h')
    local left_win = vim.fn.win_getid(left_nr)

    if left_nr ~= vim.fn.winnr() and is_normal_window(left_win) then
        vim.api.nvim_win_call(left_win, function()
            vim.cmd('vertical resize +' .. resize_amount)  -- Expand the left window
        end)
    else
        vim.notify("Cannot shrink the left edge", vim.log.levels.INFO)
    end
end
function M.grow_top_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_VERTICAL_RESIZE_AMOUNT
    local top_nr = vim.fn.winnr('k')  -- Get the window number above
    local top_win = vim.fn.win_getid(top_nr)  -- Get the window ID above

    -- Ensure the top window is valid and is different from the current window
    if top_nr ~= vim.fn.winnr() and is_normal_window(top_win) then
        vim.api.nvim_win_call(top_win, function()
            vim.cmd('resize -' .. resize_amount)  -- Shrink the top window
        end)
    else
        vim.notify("Cannot grow the top edge", vim.log.levels.INFO)
    end
end
function M.shrink_top_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_VERTICAL_RESIZE_AMOUNT
    local top_nr = vim.fn.winnr('k')
    local top_win = vim.fn.win_getid(top_nr)

    if top_nr ~= vim.fn.winnr() and is_normal_window(top_win) then
        vim.api.nvim_win_call(top_win, function()
            vim.cmd('resize +' .. resize_amount)  -- Expand the top window
        end)
    else
        vim.notify("Cannot shrink the top edge", vim.log.levels.INFO)
    end
end
function M.shrink_right_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_HORIZONTAL_RESIZE_AMOUNT
    local right_nr = vim.fn.winnr('l')
    local right_win = vim.fn.win_getid(right_nr)

    if right_nr ~= vim.fn.winnr() and is_normal_window(right_win) then
        vim.api.nvim_win_call(right_win, function()
            vim.cmd('vertical resize +' .. resize_amount)  -- Expand the right window
        end)
    else
        vim.notify("Cannot shrink the right edge", vim.log.levels.INFO)
    end
end
function M.grow_right_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_HORIZONTAL_RESIZE_AMOUNT
    local right_nr = vim.fn.winnr('l')
    local right_win = vim.fn.win_getid(right_nr)

    if right_nr ~= vim.fn.winnr() and is_normal_window(right_win) then
        vim.api.nvim_win_call(right_win, function()
            vim.cmd('vertical resize -' .. resize_amount)  -- Shrink the right window
        end)
    else
        vim.notify("Cannot grow the right edge", vim.log.levels.INFO)
    end
end
function M.shrink_bottom_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_VERTICAL_RESIZE_AMOUNT
    local bottom_nr = vim.fn.winnr('j')
    local bottom_win = vim.fn.win_getid(bottom_nr)

    if bottom_nr ~= vim.fn.winnr() and is_normal_window(bottom_win) then
        vim.api.nvim_win_call(bottom_win, function()
            vim.cmd('resize +' .. resize_amount)  -- Expand the bottom window
        end)
    else
        vim.notify("Cannot shrink the bottom edge", vim.log.levels.INFO)
    end
end
function M.grow_bottom_edge(resize_amount)
    resize_amount = resize_amount or DEFAULT_VERTICAL_RESIZE_AMOUNT
    local bottom_nr = vim.fn.winnr('j')
    local bottom_win = vim.fn.win_getid(bottom_nr)

    if bottom_nr ~= vim.fn.winnr() and is_normal_window(bottom_win) then
        vim.api.nvim_win_call(bottom_win, function()
            vim.cmd('resize -' .. resize_amount)  -- Shrink the bottom window
        end)
    else
        vim.notify("Cannot grow the bottom edge", vim.log.levels.INFO)
    end
end
return M
