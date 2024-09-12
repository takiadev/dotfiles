local Mappings = {}
-- kinds: a:action, v:verb, m:motion, c:combination o:object
-- if true then return Mappings end

-- better up/down
local down = "v:count == 0 ? 'gj' : 'j'"
local up = "v:count == 0 ? 'gk' : 'k'"


Mappings.keymap = {
    {'@',	'nxo',	'<nop>',	kind=' ',	desc='',	                },
	{'q',	'nx',	'<fn>',		kind='v',	desc='Toggle comment',	    unset={'gc'}	},
    {'q',	'o',	'<fn>',		kind='v',	desc='Comment object',	    unset={'gc'}	},
	{'Q',	'n',	'<fn>',		kind='a',	desc='Toggle comment line',	unset={'gcc'}	},
    {'Q',	'xo',	'<nop>',	kind=' ',	desc=''                     },
	{'w',	'nxo',	'w',	    kind='m',	desc='Word'                 },
    {'W',	'nxo',	'W',	    kind='m',	desc='WORD',                },
    {'f',	'nxo',	'<fn>',		kind='m',	desc='Find char'	        },
    {'F',	'nxo',	'<fn>',		kind='m',	desc='rFind char'	        },
    {'p',	'nxo',	'<fn>',		kind='m',	desc='Precede char'	        },
    {'P',	'nxo',	'<fn>',		kind='m',	desc='rPrecede char'	    },
    --{'g',	'nx',	'g',		kind=' ',	desc=''	                    },
	--{'G',	'nx',	'G',		kind=' ',	desc=''	                    },
	{'j',	'n',	'J',		kind='a',	desc='Join lines'	        },
	{'j',	'x',	'<nop>',	kind=' ',	desc=''         	        },
	{'J',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	{'l',	'n',	'o',		kind='a',	desc='Insert Line below'    },
	{'l',	'xo',	'<fn>',		kind='o',	desc='Line'                 },
	{'L',	'n',	'O',		kind='a',	desc='Insert Line above'    },
	{'L',	'xo',	'<fn>',		kind=' ',	desc=''                     },
	{'u',	'nxo',	up,	    	kind='m',	desc='Up',	expr=true, silent=true },
	{'U',	'nx',	'K',		kind='a',	desc='Help',                },
	{'y',	'nx',	'q',    	kind='a',	desc='Record Macro'         },
	{'Y',	'nx',	'@',    	kind='a',	desc='Replay Macro'         },
	{'a',	'n',	'a',		kind='a',	desc='Append'               },
	{'a',	'xo',	'a',		kind='o',	desc='around'               },
	{'A',	'n',	'A',		kind='a',	desc='Append at EOL'        },
	{'r',	'nx',	'c',		kind='v',	desc='Replace'              },
	{'R',	'nx',	'C',		kind='a',	desc='Replace line'         },
	{'s',	'nx',	'v',		kind='v',	desc='Select'               },
	{'S',	'nx',	'V',		kind='a',	desc='Select line'          },
	{'t',	'n',	'i',		kind='a',	desc='Text insert',         },
	{'t',	'xo',	'i',		kind='o',	desc='inner'                },
	{'T',	'nx',	'I',		kind='a',	desc='Text insert at BOL'	},
	{'d',	'nx',	'u',		kind='a',	desc='Undo'	                },
	{'D',	'nx',	'<c-r>',	kind='a',	desc='Redo'	                },
	{'h',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	{'H',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	{'n',	'nxo',	'h',		kind='m',	desc='Left',	            },
	{'N',	'nxo',	'H',		kind='m',	desc='Screen Top',	        },
	{'e',	'nxo',	down,		kind='m',	desc='Down', expr=true, silent=true },
	{'E',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	{'i',	'nxo',	'l',		kind='m',	desc='Right',	            },
	{'I',	'nxo',	'L',		kind='m',	desc='Screen bottom',	    },
	{'o',	'nx',	'z',	    kind='c',	desc='Menu: Open'	        },
	{'O',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	--{'z',	'nx',	'z',		kind='a',	desc='Folds',               },
    {'zt',  'nx',   'za',       kind='a',  desc='Toggle Fold Under Cursor', remap=true },
    {'za',  'nx',   '<nop>',    kind='a',  desc='', remap=true          },
	--{'Z',	'nx',	'',	        kind='a',	desc=''                     },
	{'x',	'nx',	'd',		kind='v',	desc='Cut'	                },
	{'X',	'nx',	'D',		kind='a',	desc='Cut to EOL'	        },
	{'c',	'nx',	'y',		kind='v',	desc='Copy'	                },
	{'C',	'nx',	'Y',		kind='a',	desc='Copy Line'	        },
	{'v',	'nx',	'p',		kind='a',	desc='Paste'	            },
	{'V',	'nx',	'P',		kind='a',	desc='Paste line'	        },
	{'b',	'nx',	'x',		kind='a',	desc='Bulldoze char'	    },
	{'B',	'nx',	'R',		kind='a',	desc='Overwrite mode'	    },
	{'k',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	{'K',	'nx',	'<nop>',	kind=' ',	desc=''	                    },
	{'<',	'x',	'<gv',		kind='a',	desc='Decrease Indentation'	},
	{'>',	'x',	'>gv',		kind='a',	desc='Decrease Indentation'	},

    -- g keybinds
	{'ge',	'nxo',	'gj',		kind='m',	desc='Down (multiline)',	},
	{'gu',	'nxo',	'gk',		kind='m',	desc='Up (multiline)',	    },
	{'gl',	'nxo',	'<fn>',		kind='m',	desc='Go to line'	        },

    -- System keybinds
	{'<C-z>',	'nxi',	'u',	            kind='a',	desc='Undo'	    },
	{'<C-x>',	'nxi',	'"+d',	            kind='v',	desc='Cut'	    },
	{'<C-c>',	'nxi',	'"+y',	            kind='v',	desc='Copy'	    },
	{'<C-v>',	'nx',	'"+p',	            kind='a',	desc='Paste'	},
    {'<C-v>',	'i',	'<C-r>+',	        kind='a',	desc='Copy'	    },
	{'<C-s>',	'nx',	'<cmd>w<cr><esc>',	kind='a',	desc="Save File"},

    -- ALT + NEUI for navigating windows

    {'<M-n>',   'n',    '<C-w>h',               kind='a',   desc="Go to Left Window" , remap=true, unset={'<C-h>'} },
    {'<M-n>',   'ti',   '<C-\\><C-N><C-w>h',    kind='a',   desc="Go to Left Window" , remap=true, unset={'<C-h>'} },
    {'<M-e>',   'n',    '<C-w>j',               kind='a',   desc="Go to Lower Window", remap=true, unset={'<C-j>'} },
    {'<M-e>',   'ti',   '<C-\\><C-N><C-w>j',    kind='a',   desc="Go to Lower Window", remap=true, unset={'<C-j>'} },
    {'<M-u>',   'n',    '<C-w>k',               kind='a',   desc="Go to Upper Window", remap=true, unset={'<C-k>'} },
    {'<M-u>',   'ti',   '<C-\\><C-N><C-w>k',    kind='a',   desc="Go to Upper Window", remap=true, unset={'<C-k>'} },
    {'<M-i>',   'n',    '<C-w>l',               kind='a',   desc="Go to Right Window", remap=true, unset={'<C-l>'} },
    {'<M-i>',   'ti',   '<C-\\><C-N><C-w>l',    kind='a',   desc="Go to Right Window", remap=true, unset={'<C-l>'} },
    -- Misc
    {'<down>',  'nx',  down, kind='a', desc='Down', expr=true, silent=true},
    {'<up>',  'nx',    up,   kind='a', desc='Down', expr=true, silent=true},
}

--[[
    :tnoremap <A-h> <C-\><C-N><C-w>h
    :tnoremap <A-j> <C-\><C-N><C-w>j
    :tnoremap <A-k> <C-\><C-N><C-w>k
    :tnoremap <A-l> <C-\><C-N><C-w>l
    :inoremap <A-h> <C-\><C-N><C-w>h
    :inoremap <A-j> <C-\><C-N><C-w>j
    :inoremap <A-k> <C-\><C-N><C-w>k
    :inoremap <A-l> <C-\><C-N><C-w>l
    :nnoremap <A-h> <C-w>h
    :nnoremap <A-j> <C-w>j
    :nnoremap <A-k> <C-w>k
    :nnoremap <A-l> <C-w>l

]]
-- tabs
--[[
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
]]
--[[
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
]]

function string_to_array(s)
    local a = {}
    for i=1, #s do
        table.insert(a, s:sub(i, i))
    end
    return a
end

function Mappings.for_each(f)
    for _, m in ipairs(Mappings.keymap) do
        local arg = {
            src = m[1],
            mode_str = m[2],
            dst = (m[3] ~= '<fn>' and m[3] or nil),
            fn = (m[3] == '<fn>'),
            mode = string_to_array(m[2]),
            kind = m['kind'],
            unset = m['unset'],
            opts = { 
                desc = m.desc, 
                expr = m.expr, 
                silent = m.silent,
                nowait = m.nowait,
                remap = m.remap, 
                noremap = not m.remap,}}
        f(arg)
    end
end

function Mappings.print(m, prefix)
    print((prefix or "") .. m.src .. ": " .. (m.dst or "<fn>") .. " [" .. m.mode_str .. "]")
end

function Mappings.find(src, mode_char)
    local found = false
    Mappings.for_each(function (mapping)
        if mapping.src == src then
            for _, mode_char in ipairs(mapping.mode) do
                found = true
            end
        end
    end)
    return found
end

function Mappings.register_mappings()
    Mappings.for_each(function(mapping)

        for _, mode_char in ipairs(mapping.mode) do
            local existing_mapping = vim.fn.maparg(mapping.src, m, false, false)
            existing_mapping = existing_mapping == "<Nop>" and "" or existing_mapping
            
            if mapping.fn then
                if existing_mapping == '' then
                    -- print('WARN: No mappings found for ' .. mapping.src)
                end
                goto continue
            end

            vim.keymap.set(mapping.mode, mapping.src, mapping.dst, mapping.opts)
            ::continue::
        end
    end)

    Mappings.for_each(function(mapping)
        if mapping.unset then
            for _, v in ipairs(mapping.unset) do
                for _, mode_char in ipairs(mapping.mode) do
                    if not Mappings.find(v, mode_char) then
                        local exists = vim.fn.maparg(v, mode_char, false, false) ~= ""
                        if exists then
                            vim.keymap.del(mode_char, v, {false, false})
                        end
                    end
                end
            end
        end
    end)
end

return Mappings