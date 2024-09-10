local module = {}

module.native_objects = {
    { '"', desc = 'String "..."' },
    { "'", desc = "String '...'" },
    { "(", desc = "Block []()" },
    { ")", desc = "Block []()" },
    { "<", desc = "Block <>" },
    { ">", desc = "Block <>" },
    { "B", desc = "Block []{}" },
    { "W", desc = "WORD" },
    { "[", desc = "Block []" },
    { "]", desc = "Block []" },
    { "`", desc = "String `...`" },
    { "b", desc = "Block []()" },
    { "p", desc = "Paragraph" },
    { "s", desc = "Sentence" },
    { "t", desc = "Tag block" },
    { "w", desc = "Word" },
    { "{", desc = "Block []{}" },
    { "}", desc = "Block []{}" },
}

function module.set()
    -- line textobject
    vim.keymap.set({'x', 'o'}, 'al', ':<c-u>normal! $v0<cr>', {noremap=true, silent=true, desc="Line"})
    vim.keymap.set({'x', 'o'}, 'tl', ':<c-u>normal! $v^<cr>', {noremap=true, silent=true, desc="Line"})
    vim.keymap.set({'x', 'o'}, 'l' , ':<c-u>normal! V<cr>',   {noremap=true, silent=true, desc="Line"})
    -- vim.keymap.set({'x', 'o'}, 't', 'i', {noremap=true, desc="the"})
    
    for _, o in pairs(module.native_objects) do
        local i_src = 't' .. o[1]
        local i_dst = 'i' .. o[1]
        vim.keymap.set({'o', 'x'}, i_src, i_dst, {remap=true, desc=o['desc']})
    end
end


function module.configure_which_key_plugin()
    local wk = require("which-key")
    wk.add({
        mode={'x', 'o'},
        { "t", group = "the", icon=''},
        { "a", group = "around", icon='' },
    })
    for _, v in pairs(module.native_objects) do
        local o = v[1]
        local desc = v['desc']
        wk.add({'a' .. o, mode={'x', 'o'}, desc=desc})
    end
end

return module