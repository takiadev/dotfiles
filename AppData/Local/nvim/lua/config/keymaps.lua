-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--[[
Difference between these mappings and native vim:
- use the line object for line operations: xl = dd, cl = yy, etc.
]]

------------------------------------------------------
-- Mappings

local Mappings = {}
-- kinds: a:action, v:verb, m:motion, c:combination

Mappings.keymap = {
    ['@']     = {['nxo']  = {'<nop>',    kind=' ',       desc=''                       ,                    }},
    ['q']     = {['nx']   = {fn='cftc',  kind='v',       desc='Toggle comment'         , unset={'gc'} ,     },
                 ['o']    = {fn='cfct',  kind='v',       obj_desc='Comment object'     , unset={'gc'} ,     }},
    ['Q']     = {['n']    = {fn='cfli',  kind='a',       desc='Toggle comment line'    , unset={'gcc'},     },
                 ['xo']   = {'<Nop>',    kind='a',       desc='Toggle comment line'    ,                    }},
    ['w']     = {['n']    = {'<Nop>',    kind='c',       desc='Menu: Window'           , obj_desc='Word'    },
                 ['xo']   = {'w',        kind='m',       desc='Word'                   , obj_desc='Word'    }},
    ['W']     = {['nxo']  = {'W',        kind=' ',       desc='WORD'                   , obj_desc='WORD'    }},
    ['f']     = {['nxo']  = {'f',        kind='m',       desc='Find char'              ,                    }},
    ['F']     = {['nxo']  = {'F',        kind='m',       desc='rFind char'             ,                    }},
    ['p']     = {['nxo']  = {fn='pffj',  kind='m',       desc='Flash jump'             ,                    }},
    ['P']     = {['nxo']  = {fn='pft',   kind='m',       desc='Flash Treesitter'       ,                    }},
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
    ['X']     = {['nx']   = {'D',        kind='a',       desc='Cut to EOL'             ,                    }},
    ['c']     = {['nx']   = {'y',        kind='v',       desc='Copy'                   ,                    }},
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
    ['gl']    = {['nxo']  = {fn='pfgl',  kind='m',       desc='Go to line'             ,                              }},

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
function preprocess()
    if Mappings.preprocessed ~= nil then
        return
    end
    Mappings.preprocessed = {}
    for custom, t in pairs(Mappings.keymap) do
        for mode_str, mapping in pairs(t) do
            local dst = (mapping.fn and "") or mapping[1]
            for mode in mode_str:gmatch"." do
                desc = get_description_for_mapping(
                    mode, 
                    mapping.kind, 
                    mapping.desc, 
                    mapping.obj_desc
                )
                local arg = {
                    src=custom,
                    safe_src=sanitize(custom),
                    dst=dst,
                    safe_dst=sanitize(dst),
                    mode=mode,
                    kind=mapping.kind,
                    desc=desc,
                    remap=mapping.remap or false,
                    fn=mapping.fn or false,
                    unset=mapping.unset or {},
                }
                table.insert(Mappings.preprocessed, arg)
            end
        end
    end
end

function Mappings.for_each(f)
    preprocess()
    for _, m in ipairs(Mappings.preprocessed) do
        f(m)
    end    
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

    Mappings.for_each(
        function(mapping)
            assert(mapping, "Programming error: mapping argument should never be nil")

            -- create a new group for verbs in normal mode
            if mapping.mode == 'n' and (mapping.kind == 'v' or mapping.kind=='c') then
                assert(mapping.dst, "Mapping.dst is nil, maybe the field was renamed?")
                assert(mapping.desc, "Missing description for mapping '" .. mapping.src .. "'")
                if mapping.fn or mapping.dst=="<Nop>" then
                    wk.add({mapping.safe_src, group=mapping.desc, mode='n'})
                else
                    wk.add({mapping.safe_dst, group=mapping.desc, mode='n'})
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

    Mappings.for_each(function(mapping)
        if mapping.fn and vim.fn.maparg(mapping.safe_src, mapping.mode, false, false) ~= "" then
            -- remove mapping so that plugin can remap it later
            vim.keymap.del(mapping.mode, mapping.safe_src)
        else
            local opts = {desc=mapping.desc, remap=mapping.remap, noremap=not mapping.remap}
            vim.keymap.set(mapping.mode, mapping.safe_src, mapping.safe_dst, opts)
        end
    end)

    Mappings.for_each(function(mapping)
        for _, v in pairs(mapping.unset) do
            vim.keymap.del(mapping.mode, v)
        end
    end)
end

return Mappings