local toggle_comment = function()
    return require('vim._comment').operator()
end

local toggle_line_comment = function()
    return require('vim._comment').operator() .. '_'
end

local comment_textobject = function()
    return require('vim._comment').textobject()
end

local keymap_actions={
    toggle_comment = toggle_comment,
    toggle_line_comment = toggle_line_comment,
    comment_textobject = comment_textobject,
}

return {keymap_actions=keymap_actions}