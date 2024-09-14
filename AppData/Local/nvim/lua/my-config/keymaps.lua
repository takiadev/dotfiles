local Mappings = {}
-- kinds: a:action, v:verb, m:motion, c:combination o:object
-- if true then return Mappings end

-- better up/down
local down = "v:count == 0 ? 'gj' : 'j'"
local up = "v:count == 0 ? 'gk' : 'k'"

Mappings.keys = function(s)
  return s
end

Mappings.keymap = {
  -- {' ',	'nx',	'c',		kind='v',	desc='Replace'              },
  -- {' ',	'nx',	'C',		kind='a',	desc='Replace line'         },

  { "@", "nxo", "<nop>", kind = " ", desc = "" },
  { "q", "nx", "<fn>", kind = "v", desc = "Toggle comment", unset = { "gc" } },
  { "q", "o", "<fn>", kind = "v", desc = "Comment object", unset = { "gc" } },
  { "Q", "n", "<fn>", kind = "a", desc = "Toggle comment line", unset = { "gcc" } },
  { "Q", "xo", "<nop>", kind = " ", desc = "" },
  { "w", "nx", "u", kind = "a", desc = "Undo" },
  { "W", "nx", "<c-r>", kind = "a", desc = "Redo" },
  -- {'w',	'xo',	'w',	    kind='m',	desc='Word'                 },
  -- {'W',	'nxo',	'W',	    kind='m',	desc='WORD',                },
  { "f", "nxo", up, kind = "m", desc = "Up", expr = true, silent = true },
  { "F", "nx", "K", kind = "a", desc = "Help" },
  { "p", "nxo", "%", kind = "m", desc = "Matching ()[]{}" },
  -- {'%',   'nxo',  '<nop>',        kind=' ',   desc='<unset>'              },
  { "P", "nxo", "<fn>", kind = "m", desc = "rPrecede char" },
  -- g
  { "j", "nxo", "q", kind = "a", desc = "Record macro" },
  { "J", "nxo", "@", kind = "a", desc = "Replay macro" },
  -- { "l", "nxo", { "flash-f" }, kind = "m", desc = "Flash Jump" },
  -- { "L", "nxo", { "flash-F" }, kind = "m", desc = "Flash Treesitter" },
  { "u", "nxo", { "flash-jump" }, kind = "m", desc = "Find char" },
  { "U", "nxo", { "flash-ts" }, kind = "m", desc = "rFind char" },

  { "y", "nx", "a", kind = "a", desc = "Append text" },
  { "Y", "nx", "A", kind = "a", desc = "Append text at EOL" },
  { "a", "n", "v", kind = "v", desc = "Select" },
  { "A", "n", "V", kind = "a", desc = "Select line" },
  { "r", "nxo", "h", kind = "m", desc = "Left" },
  { "R", "nxo", "H", kind = "m", desc = "Screen Top" },
  { "s", "nxo", down, kind = "m", desc = "Down", expr = true, silent = true },
  { "S", "nx", "<nop>", kind = " ", desc = "<unset>" },
  { "t", "nxo", "l", kind = "m", desc = "Right" },
  { "T", "nxo", "L", kind = "m", desc = "Screen bottom" },
  { "d", "nx", "<nop>", kind = "a", desc = "<unset>" },
  { "D", "nx", "<nop>", kind = "a", desc = "<unset>" },
  { "h", "nx", "<nop>", kind = " ", desc = "" },
  { "H", "nx", "<nop>", kind = " ", desc = "" },
  { "n", "n", "c", kind = "a", desc = "Erase (change)" },
  { "N", "n", "C", kind = "a", desc = "Erase line (change)" },
  { "e", "nxo", "g", kind = "c", desc = "Go..." },
  { "E", "nxo", "G", kind = "c", desc = "Go..." },
  -- i
  -- o
  -- z
  -- Z
  { "x", "nx", "d", kind = "v", desc = "Cut" },
  { "X", "nx", "D", kind = "a", desc = "Cut to EOL" },
  { "c", "nx", "y", kind = "v", desc = "Copy" },
  { "C", "nx", "Y", kind = "a", desc = "Copy Line" },
  { "v", "nx", "p", kind = "a", desc = "Paste" },
  { "V", "nx", "P", kind = "a", desc = "Paste line" },
  { "b", "nx", "x", kind = "a", desc = "Bulldoze char" },
  { "B", "nx", "R", kind = "a", desc = "Overwrite mode" },
  { "k", "nx", "<nop>", kind = " ", desc = "" },
  { "K", "nx", "<nop>", kind = " ", desc = "" },
  -- m
  { "<", "x", "<gv", kind = "a", desc = "Decrease Indentation" },
  { ">", "x", ">gv", kind = "a", desc = "Increase Indentation" },
  -- { ".", "nx", { "flash-;" }, kind = "m", desc = "Repeat search" },
  -- { ",", "nx", { "flash-," }, kind = "m", desc = "Repeat search" },
  -- g keybinds
  { "ge", "nxo", "gj", kind = "m", desc = "Down (multiline)" },
  { "gu", "nxo", "gk", kind = "m", desc = "Up (multiline)" },
  { "gl", "nxo", "<fn>", kind = "m", desc = "Go to line" },

  -- System keybinds
  { "<C-z>", "nxi", "u", kind = "a", desc = "Undo" },
  { "<C-x>", "nxi", '"+d', kind = "v", desc = "Cut" },
  { "<C-c>", "nxi", '"+y', kind = "v", desc = "Copy" },
  { "<C-v>", "nx", '"+p', kind = "a", desc = "Paste" },
  { "<C-v>", "ic", "<C-r>+", kind = "a", desc = "Copy" },
  { "<C-s>", "nx", "<cmd>w<cr><esc>", kind = "a", desc = "Save File" },

  -- ALT + RSFT for navigating windows

  { "<M-r>", "n", "<C-w>h", kind = "a", desc = "Go to Left Window", remap = true, unset = { "<C-h>" } },
  { "<M-r>", "ti", "<C-\\><C-N><C-w>h", kind = "a", desc = "Go to Left Window", remap = true, unset = { "<C-h>" } },
  { "<M-s>", "n", "<C-w>j", kind = "a", desc = "Go to Lower Window", remap = true, unset = { "<C-j>" } },
  { "<M-s>", "ti", "<C-\\><C-N><C-w>j", kind = "a", desc = "Go to Lower Window", remap = true, unset = { "<C-j>" } },
  { "<M-f>", "n", "<C-w>k", kind = "a", desc = "Go to Upper Window", remap = true, unset = { "<C-k>" } },
  { "<M-f>", "ti", "<C-\\><C-N><C-w>k", kind = "a", desc = "Go to Upper Window", remap = true, unset = { "<C-k>" } },
  { "<M-t>", "n", "<C-w>l", kind = "a", desc = "Go to Right Window", remap = true, unset = { "<C-l>" } },
  { "<M-t>", "ti", "<C-\\><C-N><C-w>l", kind = "a", desc = "Go to Right Window", remap = true, unset = { "<C-l>" } },
  -- Misc
  { "<down>", "nx", down, kind = "a", desc = "Down", expr = true, silent = true },
  { "<up>", "nx", up, kind = "a", desc = "Down", expr = true, silent = true },
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
  for i = 1, #s do
    table.insert(a, s:sub(i, i))
  end
  return a
end

function Mappings.for_each(f)
  for _, m in ipairs(Mappings.keymap) do
    local arg = {
      src = m[1],
      mode_str = m[2],
      dst = (type(m[3]) ~= "table" and m[3] or nil),
      fn = (type(m[3]) == "table" and m[3][1]),
      mode = string_to_array(m[2]),
      kind = m["kind"],
      unset = m["unset"],
      opts = {
        desc = m.desc,
        expr = m.expr,
        silent = m.silent,
        nowait = m.nowait,
        remap = m.remap,
        noremap = not m.remap,
      },
    }
    local returned = f(arg)
    if returned ~= nil then
      return returned
    end
  end
end

function Mappings.get(key)
  local default = {
    src = "<leader><leader><leader><leader>nop",
    mode = { "n" },
    mode_str = "n",
    opts = { desc = "UNUSED", expr = true, noremap = true },
  }
  local r = Mappings.for_each(function(m)
    if m.fn == key then
      return m -- found! stop iteration
    end
  end)
  return r and r or default
end

function Mappings.print(m, prefix)
  if m == nil then
    print((prefix or "") .. " nil")
  else
    print((prefix or "") .. " " .. m.src .. ": " .. (m.dst or m.fn) .. " [" .. m.mode_str .. "]")
  end
end

function Mappings.exists(src, mode_char)
  local found = false
  local v = Mappings.for_each(function(mapping)
    if mapping.src == src then
      for _, mode_char in ipairs(mapping.mode) do
        return true -- found! stop iteration
      end
    end
  end)
  return v or found
end

function Mappings.register_mappings()
  Mappings.for_each(function(mapping)
    for _, mode_char in ipairs(mapping.mode) do
      local existing_mapping = vim.fn.maparg(mapping.src, mode_char, false, false)

      if mapping.fn then
        if existing_mapping == "" then
          Mappings.print(mapping, "WARNING, no function found for:")
        end
      else
        vim.keymap.set(mapping.mode, mapping.src, mapping.dst, mapping.opts)
      end
    end
  end)

  Mappings.for_each(function(mapping)
    if mapping.unset then
      for _, v in ipairs(mapping.unset) do
        for _, mode_char in ipairs(mapping.mode) do
          if not Mappings.exists(v, mode_char) then
            local exists = vim.fn.maparg(v, mode_char, false, false) ~= ""
            if exists then
              vim.keymap.del(mode_char, v, { false, false })
            end
          end
        end
      end
    end
  end)
end

return Mappings

