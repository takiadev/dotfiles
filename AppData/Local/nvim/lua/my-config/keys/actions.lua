-- file: C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions2.lua
return {
  do_append = {
    n = { src = "y", plugin = "keymap", dst = "a", opts = { desc = "do_append" } },
  },
  do_append_eol = {
    n = { src = "Y", plugin = "keymap", dst = "A", opts = { desc = "do_append_eol" } },
  },
  do_change_eol = {
    n = { src = "N", plugin = "keymap", dst = "C", opts = { desc = "do_change_eol" } },
  },
  do_comment_line = {
    n = { plugin = "keymap", dst = "gcc", opts = { desc = "do_comment_line", remap = true }, },
    i = { plugin = "keymap", dst = '<cmd>normal gcc<CR>', opts = { remap = true, silent = true },} 
  },
  do_copy_eol = {
    n = { src = "C", plugin = "keymap", dst = '"+Y', opts = { desc = "do_copy_eol" } },
  },
  do_cut_eol = {
    n = { src = "X", plugin = "keymap", dst = '"+D', opts = { desc = "do_cut_eol" } },
  },
  do_delete_char = {
    n = { src = "b", plugin = "keymap", dst = "x", opts = { desc = "do_delete_char" } },
  },
  do_delete_eol = {
    n = { src = "D", plugin = "keymap", dst = "D", opts = { desc = "do_delete_eol" } },
  },
  do_g_prefix = {
    nx = { src = "g", plugin = "keymap", dst = "g", opts = { desc = "do_g_prefix" } },
  },
  do_insert = {
    n = { src = "i", plugin = "keymap", dst = "i", opts = { desc = "do_insert" } },
  },
  do_insert_bol = {
    n = { src = "I", plugin = "keymap", dst = "I", opts = { desc = "do_insert_bol" } },
  },
  do_newline_insert = {
    nx = { src = "o", plugin = "keymap", dst = "o", opts = { noremap = true, silent = true, desc = "Insert newline and enter insert mode" } },
    i = { src = "<M-o>", plugin = "keymap", dst = "<Cmd>normal! o<CR>", opts = { noremap = true, silent = true, desc = "Insert newline in insert mode" } },
  },
  do_newline_insert_before = {
      nx = { src = "O", plugin = "keymap", dst = "O", opts = { noremap = true, silent = true, desc = "Insert newline before and enter insert mode" } },
      i = { src = "<M-O>", plugin = "keymap", dst = "<Cmd>normal! O<CR>", opts = { noremap = true, silent = true, desc = "Insert newline before in insert mode" } },
  },
  do_nothing = {
    ncisotvx = { src= "s", plugin = "keymap", dst = "<nop>", opts = {noremap = true, desc = ""} },
  },
  do_paste = {
    nvx = { src = "<C-v>", plugin = "keymap", dst = '"+p', opts = { noremap = true, desc = "Paste" } },
    i = { src = "<C-v>", plugin = "keymap", dst = '<Esc>"+pa', opts = { noremap = true, desc = "Paste" } },
    t = { src = "<C-v>", plugin = "keymap", dst = '<C-\\><C-n>"+p', opts = { noremap = true, desc = "Paste" } },
    c = { src = "<C-v>", plugin = "keymap", dst = '<C-r>+', opts = { noremap = true, silent = true, desc = "Paste" } },
    o = { src = "<C-v>", plugin = "keymap", dst = '"+p', opts = { noremap = true, desc = "Paste" } },
    s = { src = "<C-v>", plugin = "keymap", dst = '"+p', opts = { noremap = true, desc = "Paste" } },
},
  do_paste_before = {
    n = { src = "V", plugin = "keymap", dst = '"+P', opts = { desc = "do_paste_before" } },
  },
  do_play_macro = {
    n = { src = "J", plugin = "keymap", dst = "@", opts = { desc = "do_play_macro" } },
  },
  do_record_macro = {
    n = { src = "j", plugin = "keymap", dst = "q", opts = { desc = "do_record_macro" } },
  },
  do_redo = {
    n = { src = "W", plugin = "keymap", dst = "<C-r>", opts = { desc = "do_redo" } },
    i = { src = "W", plugin = "keymap", dst = "<C-o><C-r>", opts = { noremap=true, desc = "do_redo" } },
  },
  do_repeat_last_cmd = {
    nx = { src = ";", plugin = "keymap", dst = ".", opts = { desc = "do_repeat_last_cmd" } },
  },
  do_replace_mode = {
    n = { src = "B", plugin = "keymap", dst = "R", opts = { desc = "do_replace_mode" } },
  },
  do_save_file = {
    vx = {
      src = "<C-s>",
      plugin = "keymap",
      dst = "<Esc>:w<CR>gv",
      opts = { noremap = true, desc = "Save File", silent = true },
    },
    t = {
      src = "<C-s>",
      plugin = "keymap",
      dst = "<C-\\><C-n>:w<CR>",
      opts = { noremap = true, desc = "Save File", silent = true },
    },
    i = {
      src = "<C-s>",
      plugin = "keymap",
      dst = "<Esc>:w<CR>a",
      opts = { noremap = true, desc = "Save File", silent = true },
    },
    o = {
      src = "<C-s>",
      plugin = "keymap",
      dst = "<Esc>:w<CR>",
      opts = { noremap = true, desc = "Save File", silent = true },
    },
    n = {
      src = "<C-s>",
      plugin = "keymap",
      dst = ":w<CR>",
      opts = { noremap = true, desc = "Save File", silent = true },
    },
  },
  do_select_all = {
    nvx = { src = "<C-a>", plugin = "keymap", dst = "ggVG", opts = { noremap = true, desc = "Select All" } },
    i = { src = "<C-a>", plugin = "keymap", dst = "<Esc>ggVG", opts = { noremap = true, desc = "Select All" } },
    t = { src = "<C-a>", plugin = "keymap", dst = "<C-\\><C-n>ggVG", opts = { noremap = true, desc = "Select All" } },
  },
  do_select_line = {
    nx = { src = "A", plugin = "keymap", dst = "V", opts = { desc = "do_select_line" } },
  },
  do_set_mark = {
    nx = { src = "m", plugin = "keymap", dst = "m", opts = { desc = "do_set_mark" } },
  },
  do_ts_select = {
    nx = { src = "U", plugin = "keymap", dst = "<Plug>flash.tss", opts = { remap=true, desc = "mo_ts_find" } },
  },
  do_undo = {
    nvx = { src = "<C-z>", plugin = "keymap", dst = "u", opts = { noremap = true, desc = "Undo" } },
    i = { src = "<C-z>", plugin = "keymap", dst = "<C-o>u", opts = { noremap = true, desc = "Undo" } },
    t = { src = "<C-z>", plugin = "keymap", dst = "<C-\\><C-n>u", opts = { noremap = true, desc = "Undo" } },
  },
  do_z_prefix = {
    nxviocts = { src="z", plugin = "keymap", dst = "z", opts={remap=true, desc= "Z prefix"}},
  },
  do_scroll_up_3 = {
    nox = { src="sf", plugin="keymap", dst="3<C-y>", opts={noremap=true, desc="Scroll screen up by 3 lines"} },
},
do_scroll_up_1 = {
    nox = { src="sF", plugin="keymap", dst="<C-y>", opts={noremap=true, desc="Scroll screen up by 1 line"} },
},
do_scroll_down_3 = {
    nox = { src="ss", plugin="keymap", dst="3<C-e>", opts={noremap=true, desc="Scroll screen down by 3 lines"} },
},
do_scroll_down_1 = {
    nox = { src="sS", plugin="keymap", dst="<C-e>", opts={noremap=true, desc="Scroll screen down by 1 line"} },
},
mo_last_jump = {
    nox = { src="sp", plugin="keymap", dst="``", opts={noremap=true, desc="Jump to last jump"} },
},
mo_last_change = {
    nox = { src="si", plugin="keymap", dst="`\"", opts={noremap=true, desc="Jump to last change"} },
},
mo_last_insert = {
    nox = { src="sy", plugin="keymap", dst="`.", opts={noremap=true, desc="Jump to last insert"} },
},
mo_prev_jump_list = {
    nox = { src="s,", plugin="keymap", dst="<C-o>", opts={noremap=true, desc="Go to previous jump list"} },
},
mo_next_jump_list = {
    nox = { src="s.", plugin="keymap", dst="<C-i>", opts={noremap=true, desc="Go to next jump list"} },
},
mo_prev_change_list = {
    nox = { src="s<", plugin="keymap", dst="g;", opts={noremap=true, desc="Go to previous change list"} },
},
mo_next_change_list = {
    nox = { src="s>", plugin="keymap", dst="g,", opts={noremap=true, desc="Go to next change list"} },
},
mo_matching_pair = {
    nox = { src="p", plugin="keymap", dst="%", opts={noremap=true, desc="Jump to matching pair"} },
},
mo_bol = {
    nox = { src="sa", plugin="keymap", dst="0", opts={noremap=true, desc="Move to beginning of line"} },
},
mo_bol_nonblank = {
    nox = { src="sr", plugin="keymap", dst="^", opts={noremap=true, desc="Move to first non-blank character of line"} },
},
mo_eol = {
    nox = { src="st", plugin="keymap", dst="$", opts={noremap=true, desc="Move to end of line"} },
},
mo_start_of_word = {
    nox = { src="sw", plugin="keymap", dst="w", opts={noremap=true, desc="Move to start of next word"} },
},
mo_jump_to_line = {
    nox = { src="sf", plugin="keymap", dst="<Plug>flash.line", opts={remap=true, desc="Jump to specific line"} },
},
mo_prev_start_of_word = {
    nox = { src="sb", plugin="keymap", dst="b", opts={noremap=true, desc="Move to start of previous word"} },
},
mo_end_of_word = {
    nox = { src="se", plugin="keymap", dst="e", opts={noremap=true, desc="Move to end of word"} },
},
mo_next_match = {
  nox = { src="", plugin="keymap", dst="n", opts={noremap=true, desc="Go to next match in search"} },
},
mo_prev_match = {
    nox = { src="", plugin="keymap", dst="N", opts={noremap=true, desc="Go to previous match in search"} },
},

  mo_find_char = {
    nox = {plugin="keymap", dst="<Plug>flash.f", opts = {desc = "mo_find_char", remap=true,}},
  },
  mo_rfind_char = {
    nox = {plugin="keymap", dst="<Plug>flash.F", opts = { remap=true, desc = "mo_rfind_char" } },
  },
  mo_till_char = {
    nox = {plugin="keymap", dst="<Plug>flash.t", opts = {desc = "mo_till_char", remap=true,}},
    -- nox = {plugin="keymap", dst="t", opts = {desc = "mo_till_char", noremap=true,}},
  },
  mo_rtill_char = {
    nox = {plugin="keymap", dst="<Plug>flash.T", opts = { remap=true, desc = "mo_rtill_char"}},
    -- nox = {plugin="keymap", dst="T", opts = { noremap=true, desc = "mo_rtill_char"}},
  },
  mo_repeat_find = {
    nox = {plugin="keymap", dst="<Plug>flash.;", opts = {desc = "mo_repeat_find", remap=true,}},
  },
  mo_repeat_rfind = {
    nox = {plugin="keymap", dst="<Plug>flash.,", opts = { remap=true, desc = "mo_repeat_rfind" } },
  },
  mo_screen_bottom = {
    nox = { src = "T", plugin = "keymap", dst = "L", opts = { desc = "mo_screen_bottom" } },
  },
  mo_screen_top = {
    nox = { src = "R", plugin = "keymap", dst = "H", opts = { desc = "mo_screen_top" } },
  },
  mo_find_pair = {
    nox = { src = "u", plugin = "keymap", dst = "<Plug>flash.jump", opts = { remap=true, desc = "mo_find_pair" } },
  },
  mo_rfind_pair = {
    nox = { src = "U", plugin = "keymap", dst = "F", opts = { noremap = true, desc = "mo_rfind_pair" } },
  },
  mo_ts_find = {
    nox = { src = "U", plugin = "keymap", dst = "<Plug>flash.ts", opts = { remap=true, desc = "mo_ts_find" } },
  },
    mo_up = {
      nox = { src = "f", plugin = "keymap", dst = "v:count == 0 ? 'gk' : 'k'", opts = { silent = true, expr = true, desc = "Move cursor ↑" }, },
      i = { src = "", plugin = "keymap", dst = "<Up>", opts = { silent = true, expr = false, desc = "Move cursor ↑" }, },
      t = { src = "", plugin = "keymap", dst = "<C-\\><C-N><C-w>k", opts = { silent = true, expr = false, desc = "Move cursor ↑ in terminal mode" }, },
    },
    mo_down = {
      nox = { src = "s", plugin = "keymap", dst = "v:count == 0 ? 'gj' : 'j'", opts = { silent = true, expr = true, desc = "Move cursor ↓" }, },
      i = { src = "", plugin = "keymap", dst = "<Down>", opts = { silent = true, expr = false, desc = "Move cursor ↓" }, },
      t = { src = "", plugin = "keymap", dst = "<C-\\><C-N><C-w>j", opts = { silent = true, expr = false, desc = "Move cursor ↓ in terminal mode" }, },
    },
    mo_left = {
      nox = { src = "a", plugin = "keymap", dst = "h", opts = { silent = true, desc = "Move cursor ←" }, },
      i = { src = "", plugin = "keymap", dst = "<Left>", opts = { silent = true, expr = false, desc = "Move cursor ←" }, },
      t = { src = "", plugin = "keymap", dst = "<C-\\><C-N><C-w>h", opts = { silent = true, expr = false, desc = "Move cursor ← in terminal mode" }, },
    },
    mo_right = {
      nox = { src = "d", plugin = "keymap", dst = "l", opts = { silent = true, desc = "Move cursor →" }, },
      i = { src = "", plugin = "keymap", dst = "<Right>", opts = { silent = true, expr = false, desc = "Move cursor →" }, },
      t = { src = "", plugin = "keymap", dst = "<C-\\><C-N><C-w>l", opts = { silent = true, expr = false, desc = "Move cursor → in terminal mode" }, },
    },

  op_around = {
    x = { src = "y", plugin = "keymap", dst = "a", opts = { desc = "op_around" } },
  },
  op_inner = {
    x = { src = "i", plugin = "keymap", dst = "i", opts = { desc = "op_inner" } },
  },
  op_surround = {
    x = { src = "s", plugin = "keymap", dst = "s", opts = { desc = "op_surround" } },
  },
  prefix_motion_menu = {
    nox = { src="s", plugin="keymap", dst="<nop>", opts={noremap=true, desc="Prefix for motion menu"} },
  },
  sys_next_buffer = {
    vx = {
      src = "<A-p>",
      plugin = "keymap",
      dst = "<Esc>:bnext<CR>gv",
      opts = { noremap = true, desc = "Next Buffer", silent = true },
    },
    t = {
      src = "<A-p>",
      plugin = "keymap",
      dst = "<C-\\><C-n>:bnext<CR>",
      opts = { noremap = true, desc = "Next Buffer", silent = true },
    },
    o = {
      src = "<A-p>",
      plugin = "keymap",
      dst = "<Esc>:bnext<CR>",
      opts = { noremap = true, desc = "Next Buffer", silent = true },
    },
    i = {
      src = "<A-p>",
      plugin = "keymap",
      dst = "<Esc>:bnext<CR>a",
      opts = { noremap = true, desc = "Next Buffer", silent = true },
    },
    n = {
      src = "<A-p>",
      plugin = "keymap",
      dst = ":bnext<CR>",
      opts = { noremap = true, desc = "Next Buffer", silent = true },
    },
  },
  sys_previous_buffer = {
    vx = {
      src = "<A-w>",
      plugin = "keymap",
      dst = "<Esc>:bprevious<CR>gv",
      opts = { noremap = true, desc = "Previous Buffer", silent = true },
    },
    t = {
      src = "<A-w>",
      plugin = "keymap",
      dst = "<C-\\><C-n>:bprevious<CR>",
      opts = { noremap = true, desc = "Previous Buffer", silent = true },
    },
    i = {
      src = "<A-w>",
      plugin = "keymap",
      dst = "<Esc>:bprevious<CR>a",
      opts = { noremap = true, desc = "Previous Buffer", silent = true },
    },
    o = {
      src = "<A-w>",
      plugin = "keymap",
      dst = "<Esc>:bprevious<CR>",
      opts = { noremap = true, desc = "Previous Buffer", silent = true },
    },
    n = {
      src = "<A-w>",
      plugin = "keymap",
      dst = ":bprevious<CR>",
      opts = { noremap = true, desc = "Previous Buffer", silent = true },
    },
  },
  sys_window_down = {
    inovx = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-w>j",
      opts = { noremap = true, desc = "Move to Down Window ↓" },
    },
    t = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>j",
      opts = { noremap = true, desc = "Move to Down Window ↓" },
    },
  },
  sys_window_left = {
    inovx = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-w>h",
      opts = { noremap = true, desc = "Move to Left Window ←" },
    },
    t = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>h",
      opts = { noremap = true, desc = "Move to Left Window ←" },
    },
  },
  sys_window_right = {
    inovx = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-w>l",
      opts = { noremap = true, desc = "Move to Right Window →" },
    },
    t = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>l",
      opts = { noremap = true, desc = "Move to Right Window →" },
    },
  },
  sys_window_up = {
    inovx = {
      src = "<A-f>",
      plugin = "keymap",
      dst = "<C-w>k",
      opts = { noremap = true, desc = "Move to Up Window ↑" },
    },
    t = {
      src = "<A-f>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>k",
      opts = { noremap = true, desc = "Move to Up Window ↑" },
    },
  },
  verb_change = {
    nx = { src = "n", plugin = "keymap", dst = "c", opts = { desc = "verb_change" } },
  },
  verb_comment = {
    n = {
      src = "q",
      plugin = "keymap",
      dst = "gc",
      opts = { noremap = false, desc = "verb_comment", remap = true },
    },
  },
  verb_copy = {
    nvx = { src = "<C-c>", plugin = "keymap", dst = '"+y', opts = { noremap = true, desc = "Copy" } },
    i = { src = "<C-c>", plugin = "keymap", dst = '<Esc>"+y', opts = { noremap = true, desc = "Copy" } },
    t = { src = "<C-c>", plugin = "keymap", dst = '<C-\\><C-n>"+y', opts = { noremap = true, desc = "Copy" } },
  },
  verb_cut = {
    nvx = { src = "<C-x>", plugin = "keymap", dst = '"+d', opts = { noremap = true, desc = "Cut" } },
    i = { src = "<C-x>", plugin = "keymap", dst = '<Esc>"+d', opts = { noremap = true, desc = "Cut" } },
    t = { src = "<C-x>", plugin = "keymap", dst = '<C-\\><C-n>"+d', opts = { noremap = true, desc = "Cut" } },
  },
  verb_delete = {
    nx = { src = "d", plugin = "keymap", dst = "d", opts = { desc = "verb_delete" } },
  },
  verb_go = {
    x = { src = "e", plugin = "keymap", dst = "e", opts = { desc = "verb_go" } },
  },
  verb_go_next = {
    n = { src = "e", plugin = "keymap", dst = "e", opts = { desc = "verb_go_next" } },
  },
  verb_go_prev = {
    nx = { src = "E", plugin = "keymap", dst = "E", opts = { desc = "verb_go_prev" } },
  },
  verb_indent = {
    n = { src = ">", plugin = "keymap", dst = ">", opts = { desc = "verb_indent" } },
    x = { src = ">", plugin = "keymap", dst = ">gv", opts = { desc = "verb_indent" } },
  },
  verb_select = {
    nx = { src = "a", plugin = "keymap", dst = "v", opts = { desc = "verb_select" } },
  },
  verb_unindent = {
    n = { src = "<", plugin = "keymap", dst = "<", opts = { desc = "verb_unindent" } },
    x = { src = "<", plugin = "keymap", dst = "<gv", opts = { desc = "verb_unindent" } },
  },
}
