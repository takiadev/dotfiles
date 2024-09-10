-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--[[
Difference between these mappings and native vim:
- use the line object for line operations: xl = dd, cl = yy, etc.
]]


local toggle_comment = function()
    return require('vim._comment').operator()
end

local toggle_line_comment = function()
    return require('vim._comment').operator() .. '_'
end

local comment_textobject = function()
    require('vim._comment').textobject()
end

--vim.keymap.set({ 'n', 'x' }, 'q', toggle_comment, { expr = true, desc = 'Toggle comment' })
--vim.keymap.set('n', 'Q', toggle_line_comment, { expr = true, desc = 'Toggle comment line' })
--vim.keymap.set({ 'o' }, 'q', comment_textobject, { desc = 'Comment textobject' })
  

-- kinds: a:action, v:verb, m:motion, c:combination
local Mappings = {}

Mappings.keymap = {
    ['@']     = {['nxo']  = {"<nop>",    kind=' ',      desc=''                        ,obj_desc=''         }},
    ['q']     = {['nx']   = {toggle_comment     ,     kind='v',   desc='Toggle comment'         , expr=true , unset={'gc'}   },
                 ['o']    = {comment_textobject ,     kind='v',   obj_desc='Comment object'     , expr=true , unset={'gc'}   }},
    ['Q']     = {['n']    = {toggle_line_comment,     kind='a',   desc='Toggle comment line'    , expr=true , unset={'gcc'}  },
                 ['xo']   = {toggle_line_comment,     kind='a',   desc='Toggle comment line'    , expr=true ,                }},
    ['w']     = {['nx']   = {'w',        kind='c',       desc='Menu: Window'           , obj_desc='Word'    }},
    ['W']     = {['nxo']  = {'W',        kind=' ',       desc='WORD'                   , obj_desc='WORD'    }},
    ['f']     = {['nxo']  = {'f',        kind='m',       desc='Find char'              ,                    }},
    ['F']     = {['nxo']  = {'F',        kind='m',       desc='rFind char'             ,                    }},
    ['p']     = {['nxo']  = {'t',        kind='m',       desc='Precede char'           ,                    }},
    ['P']     = {['nxo']  = {'t',        kind='m',       desc='rPrecede char'          ,                    }},
    ['g']     = {['nx']   = {'g',        kind=' ',       desc=''                       ,                    }},
    ['G']     = {['nx']   = {'G',        kind=' ',       desc=''                       ,                    }},
    ['j']     = {['nx']   = {'J',        kind='a',       desc='Join lines'             ,                    }},
    ['J']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['l']     = {['nx']   = {'o',        kind=' ',       desc='Insert Line below'      , obj_desc='Line'    }},
    ['L']     = {['nx']   = {'O',        kind=' ',       desc='Insert Line above'      , obj_desc=''        }},
    ['u']     = {['nxo']  = {'k',        kind='m',       desc='Go Up'                  , obj_desc='Up'      }},
    ['U']     = {['nx']   = {'K',        kind=' ',       desc='Help'                   , obj_desc=''        }},
    ['y']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['Y']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['a']     = {['nx']   = {'a',        kind='a',       desc='Append'                 , obj_desc='around'  }},
    ['A']     = {['nx']   = {'A',        kind='a',       desc='Append at EOL'          ,                    }},
    ['r']     = {['nx']   = {'c',        kind='v',       desc='Replace'                ,                    }},
    ['R']     = {['nx']   = {'C',        kind='a',       desc='Replace line'           ,                    }},
    ['s']     = {['nx']   = {'v',        kind='v',       desc='Select'                 ,                    }},
    ['S']     = {['nx']   = {'V',        kind='a',       desc='Select line'            ,                    }},
    ['t']     = {['nx']   = {'i',        kind='a',       desc='Text insert'            , obj_desc='inner'   }},
    ['T']     = {['nx']   = {'I',        kind='a',       desc='Text insert at BOL'     ,                    }},
    ['d']     = {['nx']   = {'q',        kind='a',       desc='Record macro'           ,                    }},
    ['D']     = {['nx']   = {'@',        kind='a',       desc='Do macro'               ,                    }},       
    ['h']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['H']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['n']     = {['nxo']  = {'h',        kind='m',       desc='Go Left'                , obj_desc='Left'    }},
    ['N']     = {['nxo']  = {'H',        kind='m',       desc='Go Screen Top'          , obj_desc='Screen Top'     }},
    ['e']     = {['nxo']  = {'j',        kind='m',       desc='Go Down'                , obj_desc='Down'    }},
    ['E']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['i']     = {['nxo']  = {'l',        kind='m',       desc='Go Right'               , obj_desc='Right'   }},
    ['I']     = {['nxo']  = {'L',        kind='m',       desc='Go Screen bottom'       , obj_desc='Screen Bottom'  }},
    ['o']     = {['nx']   = {' ',        kind='c',       desc='Menu: Open'             ,                    }},
    ['O']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['\\']    = {['nx']   = {'u',        kind='a',       desc='Undo'                   ,                    }},
    ['Z']     = {['nx']   = {'<C-r>',    kind='a',       desc='Redo'                   ,                    }},
    ['x']     = {['nx']   = {'d',        kind='v',       desc='Cut'                    ,                    }},
    --['xx']  = {['n' ]   = {'dd',       kind='a',       desc='Cut Line'               ,                    }},
    ['X']     = {['nx']   = {'D',        kind='a',       desc='Cut to EOL'             ,                    }},
    ['c']     = {['nx']   = {'y',        kind='v',       desc='Copy'                   ,                    }},
    --['cc']  = {['n' ]   = {'yy',       kind='a',       desc='Copy Line'              ,                    }},
    ['C']     = {['nx']   = {'Y',        kind='a',       desc='Copy Line'              ,                    }},
    ['v']     = {['nx']   = {'p',        kind='a',       desc='Paste'                  ,                    }},
    ['V']     = {['nx']   = {'P',        kind='a',       desc='Paste line'             ,                    }},
    ['b']     = {['nx']   = {'x',        kind='a',       desc='Bulldoze char'          ,                    }},
    ['B']     = {['nx']   = {'R',        kind='a',       desc='Overwrite mode'         ,                    }},
    ['k']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['K']     = {['nx']   = {' ',        kind=' ',       desc=''                       ,                    }},
    ['<']     = {['x' ]   = {'<gv',      kind='a',       desc='Decrease Indentation'   ,                    }},
    ['>']     = {['x' ]   = {'>gv',      kind='a',       desc='Decrease Indentation'   ,                    }},

    -- g keybinds
    ['ge']    = {['nxo']  = {'gj',       kind='m',       desc='Go Down (multiline)'    , obj_desc='Down (multiline)'  }},
    ['gu']    = {['nxo']  = {'gk',       kind='m',       desc='Go Up (multiline)'      , obj_desc='Up (multiline)'    }},

    -- System keybinds
    ['<C-z>'] = {['nxi']  = {'u'  ,    kind='a',       desc='Undo'                   ,                    }},
    ['<C-x>'] = {['nxi']  = {'"+d',    kind='v',       desc='Cut'                    ,                    }},
    ['<C-c>'] = {['nxi']  = {'"+y',    kind='v',       desc='Copy'                   ,                    }},
    ['<C-v>'] = {['nx' ]  = {'"+p',    kind='a',       desc='Paste'                  ,                    },
                 ['i'  ]  = {'<C-r>+', kind='a',       desc='Copy'                   ,                    }},
    ['<C-s>'] = {['nx']   = {'<cmd>w<cr><esc>',
                                       kind='a',       desc="Save File"              ,                    }},
}

function get_description_for_mapping(mode, kind, desc, obj_desc)
    -- mode should be a single char: 'n', 'v', 'x', 'o', ...

    if mode == 'n' or mode == 'i' then
        return desc
    elseif kind == 'v' and (mode == 'x' or mode == 'v')  then
        -- verbs keep their description in visual mode
        return desc
    elseif mind == 'm' and (mode == 'o' or mode == 'x' or mode == 'v') then
        -- motions 
        return obj_desc or desc
    else
        -- treat everything else as a textobject
        return obj_desc
    end
end

function for_each_mapping(f)
    for custom, t in pairs(Mappings.keymap) do
        for mode_str, mapping in pairs(t) do
            for mode in mode_str:gmatch"." do
                desc = get_description_for_mapping(
                    mode, 
                    mapping.kind, 
                    mapping.desc, 
                    mapping.obj_desc
                )
                local arg = {
                    src=custom,
                    dst=mapping[1],
                    mode=mode,
                    kind=mapping.kind,
                    desc=desc,
                    remap=mapping.remap or false,
                    expr=mapping.expr or false,
                    unset=mapping.unset or {},
                }
                f(arg)
            end
        end
    end
end

function sanitize(c)
    local result = ""
    for i=1, #c do
        local current = c:sub(i, i)
        if current == ' ' then
            current = '<space>'
        end
        result = result .. current
    end
    return result 
end

function string_to_array(s)
    local a = {}
    for i=1, #s do
        table.insert(a, s:sub(i, i))
    end
    return a 
end

function Mappings.set_leader_keys()
    -- Set leader keys, account for the langmap change
    -- Note: keys must mapped to <nop> first
    vim.g.mapleader = " "
    vim.keymap.set({'n','x'}, 'z', '<Nop>', { noremap=true, silent=true })
    vim.g.maplocalleader = "z" -- note: the langmap swaps z and \
end

function Mappings.configure_which_key_plugin()
    local wk = require("which-key")

    for_each_mapping(
        function(mapping)
            assert(mapping, "Programming error: mapping argument should never be nil")

            -- create a new group for verbs in normal mode
            if mapping.mode == 'n' and mapping.kind == 'v' then
                assert(mapping.dst, "Mapping.dst is nil, maybe the field was renamed?")
                assert(mapping.desc, "Missing description for mapping '" .. mapping.src .. "'")
                if mapping.expr then
                    wk.add({mapping.src, group=mapping.desc, mode='n'})
                else
                    wk.add({mapping.dst, group=mapping.desc, mode='n'})
                end
            end
        end
    )
    wk.add({mode={'x', 'o'}, { "g", group = "...", icon=''},})
end


function Mappings.set()
    -- we map z to undo but z has a delay 
    -- so we use a langmap to first, map z to \, and then below we map \ to undo
    -- Note: this means that every mapping for z should be written as a mapping for \ instead
    local en = [[z\\]]
    local cm = [[\\z]]
    vim.opt.langmap = cm .. ';' .. en

    for_each_mapping(function(mapping)
        if mapping.expr then
            vim.keymap.set(mapping.mode, sanitize(mapping.src), mapping.dst, {expr=true, desc=mapping.desc})
        else
            local opts = mapping.remap and {remap=true} or {noremap=true}
            opts.desc = mapping.desc    
            -- print("mapping: " .. mapping.mode .. ": " .. sanitize(mapping.src) .. " -> " .. sanitize(mapping.dst) .. " [" .. (mapping.desc or "") .. "]")
            vim.keymap.set(mapping.mode, sanitize(mapping.src), sanitize(mapping.dst), opts)
        end
    end)
    for_each_mapping(function(mapping)
        for _, v in pairs(mapping.unset) do
            vim.keymap.del(mapping.mode, v)
        end
    end)
end

return Mappings

--[[
function contains(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

local native_motions = {
    '`', '#', '$', '%', '^', '*', '(', '0', ')', '-', '_', '+', 
    'w', 'W', 'e', 'E', 't', 'T', '[', '{', ']', '}',
    'f', 'F', 'h', 'H', 'j', 'k', 'l', 'L', ';', "'", '|', 
    'b', 'B', 'n', 'N', '/', '?',
    -- also register 'a' and 'i' so that we can remap ciw caw, etc.
    'a', 'i'
}
local native_operators = {
    'd', 'c', 'y', '<', '>'
}
local descriptions = {
    ["q"] = {"Comment"},
    ["Q"] = {"Comment line"},
    ["w"] = {"Window menu", "word"},
    ["W"] = {"-", "WORD"},
    ["f"] = {"Find next char"},
    ["F"] = {"Find prev char"},
    ["p"] = {"Precede next char"},
    ["P"] = {"Precede prev char"},
    -- g
    -- G
    ["j"] = {"-"},
    ["J"] = {"-"},
    ["l"] = {"Insert line below", "line"},
    ["L"] = {"Insert line above"},
    ["u"] = {"Up"},
    ["U"] = {"Help"},
    ["y"] = {"-"},
    ["Y"] = {"-"},
    ["a"] = {"Append", "around"},
    ["A"] = {"Append at eol"},
    ["r"] = {"Replace"},
    ["R"] = {"Replace line"},
    ["s"] = {"Select"},
    ["S"] = {"Select line"},
    ["t"] = {"Text insert", "inner"},
    ["T"] = {"Text insert at bol"},
    ["d"] = {"Record do macro"},
    ["D"] = {"Do macro"},
    ["h"] = {"-", "-"},
    ["H"] = {"-", "-"},
    ["n"] = {"Left"},
    ["N"] = {"Screen Top"},
    ["e"] = {"Down"},
    ["E"] = {"Join lines"},
    ["i"] = {"Right"},
    ["I"] = {"Screen bottom"},
    ["o"] = {"Open menu"},
    ["O"] = {"-"},
    ["z"] = {"Undo"},
    ["Z"] = {"Undo line"},
    ["x"] = {"Cut"},
    ["X"] = {"Cut to eol"},
    ["c"] = {"Copy"},
    ["C"] = {"Copy line"},
    ["v"] = {"Paste after"},
    ["V"] = {"Paste before"},
    ["b"] = {"Bulldoze char"},
    ["B"] = {"Bulldoze mode"},
    ["k"] = {"-"},
    ["K"] = {"-"},
}
--]]
--local native = [[`xwft  ok  []acviq hjl 'udypr m,;/]] .. [[~XWFT  OK :{}ACVIQ HjL "UDYPR M<>?]]
--local custom = [[`qwfpgjluy;[]arstdhneio'zxcvbkm,./]] .. [[~QWFPGJLUY:{}ARSTDHNEIO"ZXCVBKM<>?]]
--local mappings = {}
--local reverse_mappings = {}
--[[
for i = 1, #native do
    local n = native:sub(i,i)
    local c = custom:sub(i,i)
    mappings[c] = n
    reverse_mappings[n] = (reverse_mappings[n] or "") .. c
end

local function map_with_desc(mode, custom, lhs, rhs)
    local adesc = descriptions[custom] or { "" }
    local desc = adesc[1]

    if desc == "" and #custom > 1 then
        local function get_sub_desc(c)
            return descriptions[c][2] or descriptions[c][1] or ""
        end
        for i=1, #custom do
            local c = custom:sub(i, i)
            local ad = descriptions[c] or {}
            local d = ""
            if i == 1 then 
                d = "" -- ad[1] or "" -- no need to repeat action everytime
            else
                d = ad[2] or ad[1] or ""
            end
            desc = desc .. d .. " "
        end
    end

    rhs['desc'] = desc
    vim.keymap.set(mode, custom, lhs, rhs)
    print("" .. custom .. " -> " .. lhs .. " (" .. (desc or "") .. ")")
end

-- Since we don't remap operator mode, we need to manually
-- add additional remappings for operator+motion combos
for i, native_op in ipairs(native_operators) do
    for j, native_motion in ipairs(native_motions) do
        local op_src = reverse_mappings[native_op]
        local motion_src = reverse_mappings[native_motion]
        if op_src == nil or op_src == '' or motion_src == nil or motion_src == '' then
            goto skip_to_next
        end
        op_src:gsub(".", function(custom_op)
            motion_src:gsub(".", function(custom_motion)
                local custom_seq = custom_op .. custom_motion
                local native_seq = native_op .. native_motion
                if custom_seq ~= native_seq then
                    map_with_desc({"n", "v"}, custom_seq, native_seq, {noremap=true})
                    -- print("Mapping: " .. custom_seq .. " -> " .. native_seq)
                end
            end)
        end)
        ::skip_to_next::
    end
end

local already_deleted = {}

-- Remap keys for normal mode

for c, n in pairs(mappings) do
    if n == ' ' then
        if already_deleted[c] then
            -- nothing
        else
            print("Deleting: " .. c)
            vim.keymap.del({"n", "v"}, c)
            already_deleted[c] = true
        end
        -- print("Mapping: " .. c .. " -> " .. "<nop>")
    elseif n ~= c then
        map_with_desc({"n", "v"}, c, n, {noremap=true})
        -- print("Mapping: " .. c .. " -> " .. n)
    end
end
--]]




--[[
function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '}\n'
    else
       return tostring(o)
    end
end

local function get_desc(mode, lhs)
    local map = vim.tbl_filter(function (x)
        return x.lhs == lhs end, vim.api.nxim_get_keymap(mode[1]))[1]
    if not map and lhs:len() > 1 then
        return get_desc(mode, lhs:sub(#lhs, #lhs))
    elseif not map or not map.rhs then
        return nil
    else
        return map.rhs['desc']
    end    
end

print("---------------------")
for i, x in pairs(vim.api.nxim_get_keymap("v")) do
    if i < 100 then
        out = ""
        if x['desc'] then
            out = (x['lhs'] or x['rawlhs'] or '<none>') .. " : " .. (x['desc'] or '<none>')
            for j, y in pairs(x) do
--                out = out .. tostring(j) .. ":" .. tostring(y) .. "   "
            end
        print(out)
        end
    end
end
print(get_desc({"n"}, "w"))
print("---------------------")
]]