local module = {}
module.en = 'QqWwFfPpGgJjLlUuYyAaRrSsTtDdHhNnEeIiOoZzXxCcVvBbKkMm'
module.cm = 'YyWwFfVvGgEeIiZzCcAaBbHhPpXxNnKkQqTtLlDdOoRrSsJjUuMm'
if true then return module end


-- x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x    
-- Qq Ww Ff Pp Gg Jj Ll Uu Yy Aa Rr Ss Tt Dd Hh Nn Ee Ii Oo Zz Xx Cc Vv Bb Kk Mm
-- Yy Ww Ff Vv Gg Ee Ii Zz Cc Aa Bb Hh Pp Xx Nn Kk Qq Tt Ll Dd Oo Rr Ss Jj Uu Mm
-- 'QqWwFfPpGgJjLlUuYyAaRrSsTtDdHhNnEeIiOoZzXxCcVvBbKkMm'
-- 'YyWwFfVvGgEeIiZzCcAaBbHhPpXxNnKkQqTtLlDdOoRrSsJjUuMm'

if true then return module end -- DISABLED

--langmap = require("config.langmap")
--langmap.set_langmap()

--vim.g.mapleader = langmap.translate_char_src(" ")
--vim.g.maplocalleader = langmap.translate_char_src("o")

local en = 'zw'--[[z\\]]
local cm = 'wz'--[[\\z]]

function module.langmap()
    return cm .. ';' .. en
end

function module.set_langmap()
    vim.opt.langremap = true
    vim.opt.langmap = module.langmap()
end

function module.translate_char_src(cm_char)
    local i = string.find(cm, cm_char, 1, true)
    if i then
        return en:sub(i, i)
    else
        return cm_char
    end
end

function module.translate_src(cm_mapping)
    local new = ''
    for c in cm_mapping:gmatch"." do
        -- do something with c
        new = new .. module.translate_char_src(c)
    end
    return new
end

return module