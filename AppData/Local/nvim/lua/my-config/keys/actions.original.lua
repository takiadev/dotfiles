return {
  ["a_WORD"] = {
    obj = { src = "W", plugin = nil, opts = { desc = "a_WORD" } },
  },
  ["a_block"] = {
    obj = { src = "b", plugin = nil, opts = { desc = "a_block" } },
    go = { src = "b", plugin = nil, opts = { desc = "a_block" } },
  },
  ["a_comment"] = {
    obj = { src = "q", plugin = nil, opts = { desc = "a_comment" } },
    go = { src = "q", plugin = nil, opts = { desc = "a_comment" } },
  },
  ["a_condition"] = {
    obj = { src = "c", plugin = nil, opts = { desc = "a_condition" } },
    go = { src = "c", plugin = nil, opts = { desc = "a_condition" } },
  },
  ["a_function"] = {
    obj = { src = "f", plugin = nil, opts = { desc = "a_function" } },
    go = { src = "f", plugin = nil, opts = { desc = "a_function" } },
  },
  ["a_function_call"] = {
    obj = { src = "F", plugin = nil, opts = { desc = "a_function_call" } },
    go = { src = "F", plugin = nil, opts = { desc = "a_function_call" } },
  },
  ["a_loop"] = {
    obj = { src = "r", plugin = nil, opts = { desc = "a_loop" } },
    go = { src = "r", plugin = nil, opts = { desc = "a_loop" } },
  },
  ["a_paragraph"] = {
    obj = { src = "p", plugin = nil, opts = { desc = "a_paragraph" } },
    go = { src = "p", plugin = nil, opts = { desc = "a_paragraph" } },
  },
  ["a_type"] = {
    obj = { src = "t", plugin = nil, opts = { desc = "a_type" } },
    go = { src = "t", plugin = nil, opts = { desc = "a_type" } },
  },
  ["a_variable"] = {
    obj = { src = "v", plugin = nil, opts = { desc = "a_variable" } },
    go = { src = "v", plugin = nil, opts = { desc = "a_variable" } },
  },
  ["a_word"] = {
    obj = { src = "w", plugin = nil, opts = { desc = "a_word" } },
    go = { src = "W", plugin = nil, opts = { desc = "a_word" } },
  },
  ["a_comment_block"] = {
    obj = { src = "Q", plugin = nil, opts = { desc = "comment_block" } },
    go = { src = "Q", plugin = nil, opts = { desc = "comment_block" } },
  },
  ["do_append"] = {
    n = { src = "y", plugin = "keymap", dst = "a", opts = { desc = "do_append" } },
  },
  ["do_append_eol"] = {
    n = { src = "Y", plugin = "keymap", dst = "A", opts = { desc = "do_append_eol" } },
  },
  ["do_change_eol"] = {
    n = { src = "N", plugin = "keymap", dst = "C", opts = { desc = "do_change_eol" } },
  },
  ["do_comment_line"] = {
    n = { src = "Q", plugin = "keymap", dst = "gcc", opts = { desc = "do_comment_line", noremap=false, remap=true } },
  },
  ["do_copy_eol"] = {
    n = { src = "C", plugin = "keymap", dst = '"+Y', opts = { desc = "do_copy_eol" } },
  },
  ["do_cut_eol"] = {
    n = { src = "X", plugin = "keymap", dst = '"+D', opts = { desc = "do_cut_eol" } },
  },
  ["do_delete_eol"] = {
    n = { src = "D", plugin = "keymap", dst = "D", opts = { desc = "do_delete_eol" } },
  },
  ["do_delete_char"] = {
    n = { src = "b", plugin = "keymap", dst = "x", opts = { desc = "do_delete_char" } },
  },
  ["do_g_prefix"] = {
    n = { src = "g", plugin = "keymap", dst = "g", opts = { desc = "do_g_prefix" } },
    x = { src = "g", plugin = "keymap", dst = "g", opts = { desc = "do_g_prefix" } },
    obj = { src = "g", plugin = "keymap", dst = "g", opts = { desc = "do_g_prefix" } },
  },
  ["do_insert"] = {
    n = { src = "i", plugin = "keymap", dst = "i", opts = { desc = "do_insert" } },
  },
  ["do_insert_bol"] = {
    n = { src = "I", plugin = "keymap", dst = "I", opts = { desc = "do_insert_bol" } },
  },
  ["do_paste_before"] = {
    n = { src = "V", plugin = "keymap", dst = '"+P', opts = { desc = "do_paste_before" } },
  },
  ["do_play_macro"] = {
    n = { src = "J", plugin = "keymap", dst = "@", opts = { desc = "do_play_macro" } },
  },
  ["do_record_macro"] = {
    n = { src = "j", plugin = "keymap", dst = "q", opts = { desc = "do_record_macro" } },
  },
  ["do_redo"] = {
    n = { src = "W", plugin = "keymap", dst = "<C_r>", opts = { desc = "do_redo" } },
  },
  ["do_repeat_last_cmd"] = {
    n = { src = ";", plugin = "keymap", dst = ".", opts = { desc = "do_repeat_last_cmd" } },
    x = { src = ";", plugin = "keymap", dst = ".", opts = { desc = "do_repeat_last_cmd" } },
  },
  ["do_replace_mode"] = {
    n = { src = "B", plugin = "keymap", dst = "R", opts = { desc = "do_replace_mode" } },
  },
  ["do_select_line"] = {
    n = { src = "A", plugin = "keymap", dst = "V", opts = { desc = "do_select_line" } },
    x = { src = "A", plugin = "keymap", dst = "V", opts = { desc = "do_select_line" } },
  },
  ["do_set_mark"] = {
    n = { src = "m", plugin = "keymap", dst = "m", opts = { desc = "do_set_mark" } },
    x = { src = "m", plugin = "keymap", dst = "m", opts = { desc = "do_set_mark" } },
  },
  ["mo_down"] = {
    n = {
      src = "s",
      plugin = "keymap",
      dst = "v:count == 0 ? 'gj' : 'j'",
      opts = { desc = "mo_down", expr = true, silent = true },
    },
    x = {
      src = "s",
      plugin = "keymap",
      dst = "v:count == 0 ? 'gj' : 'j'",
      opts = { desc = "mo_down", expr = true, silent = true },
    },
    o = {
      src = "s",
      plugin = "keymap",
      dst = "v:count == 0 ? 'gj' : 'j'",
      opts = { desc = "mo_down", expr = true, silent = true },
    },
  },
  ["mo_find_char"] = {
    n = { src = "l", plugin = "flash", dst = "f", opts = { desc = "mo_find_char" } },
    x = { src = "l", plugin = "flash", dst = "f", opts = { desc = "mo_find_char" } },
  },
  ["mo_rfind_char"] = {
    n = { src = "l", plugin = "flash", dst = "F", opts = { desc = "mo_find_char" } },
    x = { src = "l", plugin = "flash", dst = "F", opts = { desc = "mo_find_char" } },
  },
  ["mo_left"] = {
    n = { src = "r", plugin = "keymap", dst = "h", opts = { desc = "mo_left" } },
    x = { src = "r", plugin = "keymap", dst = "h", opts = { desc = "mo_left" } },
    o = { src = "r", plugin = "keymap", dst = "h", opts = { desc = "mo_left" } },
  },
  ["mo_right"] = {
    n = { src = "t", plugin = "keymap", dst = "l", opts = { desc = "mo_right" } },
    x = { src = "t", plugin = "keymap", dst = "l", opts = { desc = "mo_right" } },
    o = { src = "t", plugin = "keymap", dst = "l", opts = { desc = "mo_right" } },
  },
  ["mo_repeat_find"] = {
    n = { src = ",", plugin = "flash", dst = ";", opts = { desc = "mo_repeat_find" } },
    x = { src = ",", plugin = "flash", dst = ";", opts = { desc = "mo_repeat_find" } },
    o = { src = ",", plugin = "flash", dst = ";", opts = { desc = "mo_repeat_find" } },
  },
  ["mo_repeat_rfind"] = {
    n = { src = ",", plugin = "flash", dst = ",", opts = { desc = "mo_repeat_rfind" } },
    x = { src = ",", plugin = "flash", dst = ",", opts = { desc = "mo_repeat_rfind" } },
    o = { src = ",", plugin = "flash", dst = ",", opts = { desc = "mo_repeat_rfind" } },
  },
  ["mo_screen_bottom"] = {
    n = { src = "T", plugin = "keymap", dst = "L", opts = { desc = "mo_screen_bottom" } },
    x = { src = "T", plugin = "keymap", dst = "L", opts = { desc = "mo_screen_bottom" } },
    o = { src = "T", plugin = "keymap", dst = "L", opts = { desc = "mo_screen_bottom" } },
  },
  ["mo_screen_top"] = {
    n = { src = "R", plugin = "keymap", dst = "H", opts = { desc = "mo_screen_top" } },
    x = { src = "R", plugin = "keymap", dst = "H", opts = { desc = "mo_screen_top" } },
    o = { src = "R", plugin = "keymap", dst = "H", opts = { desc = "mo_screen_top" } },
  },
  ["mo_ultra_find"] = {
    n = { src = "u", plugin = "flash", dst = "jump", opts = { desc = "mo_ultra_find" } },
    x = { src = "u", plugin = "flash", dst = "jump", opts = { desc = "mo_ultra_find" } },
  },
  ["mo_ultra_rfind"] = {
    n = { src = "U", plugin = "flash", dst = "ts", opts = { desc = "mo_ultra_rfind" } },
    x = { src = "U", plugin = "flash", dst = "ts", opts = { desc = "mo_ultra_rfind" } },
  },
  ["mo_up"] = {
    n = {
      src = "f",
      plugin = "keymap",
      dst = "v:count == 0 ? 'gk' : 'k'",
      opts = { desc = "mo_up", expr = true, silent = true },
    },
    x = {
      src = "f",
      plugin = "keymap",
      dst = "v:count == 0 ? 'gk' : 'k'",
      opts = { desc = "mo_up", expr = true, silent = true },
    },
    o = {
      src = "f",
      plugin = "keymap",
      dst = "v:count == 0 ? 'gk' : 'k'",
      opts = { desc = "mo_up", expr = true, silent = true },
    },
  },
  ["sys_window_left"] = {
    n = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-w>h",
      opts = { desc = "Move to Left Window ←", noremap = true },
    },
    i = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-w>h",
      opts = { desc = "Move to Left Window ←", noremap = true },
    },
    x = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-w>h",
      opts = { desc = "Move to Left Window ←", noremap = true },
    },
    v = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-w>h",
      opts = { desc = "Move to Left Window ←", noremap = true },
    },
    o = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-w>h",
      opts = { desc = "Move to Left Window ←", noremap = true },
    },
    t = {
      src = "<A-r>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>h",
      opts = { desc = "Move to Left Window ←", noremap = true },
    },
  },
  ["sys_window_down"] = {
    n = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-w>j",
      opts = { desc = "Move to Down Window ↓", noremap = true },
    },
    i = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-w>j",
      opts = { desc = "Move to Down Window ↓", noremap = true },
    },
    x = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-w>j",
      opts = { desc = "Move to Down Window ↓", noremap = true },
    },
    v = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-w>j",
      opts = { desc = "Move to Down Window ↓", noremap = true },
    },
    o = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-w>j",
      opts = { desc = "Move to Down Window ↓", noremap = true },
    },
    t = {
      src = "<A-s>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>j",
      opts = { desc = "Move to Down Window ↓", noremap = true },
    },
  },
  ["sys_window_right"] = {
    n = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-w>l",
      opts = { desc = "Move to Right Window →", noremap = true },
    },
    i = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-w>l",
      opts = { desc = "Move to Right Window →", noremap = true },
    },
    x = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-w>l",
      opts = { desc = "Move to Right Window →", noremap = true },
    },
    v = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-w>l",
      opts = { desc = "Move to Right Window →", noremap = true },
    },
    o = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-w>l",
      opts = { desc = "Move to Right Window →", noremap = true },
    },
    t = {
      src = "<A-t>",
      plugin = "keymap",
      dst = "<C-\\><C-n><C-w>l",
      opts = { desc = "Move to Right Window →", noremap = true },
    },
  },
  ["sys_window_up"] = {
    n = { src = "<A-f>", plugin = "keymap", dst = "<C-w>k", opts = { desc = "Move to Up Window ↑", noremap = true } },
    i = { src = "<A-f>", plugin = "keymap", dst = "<C-w>k", opts = { desc = "Move to Up Window ↑", noremap = true } },
    x = { src = "<A-f>", plugin = "keymap", dst = "<C-w>k", opts = { desc = "Move to Up Window ↑", noremap = true } },
    v = { src = "<A-f>", plugin = "keymap", dst = "<C-w>k", opts = { desc = "Move to Up Window ↑", noremap = true } },
    o = { src = "<A-f>", plugin = "keymap", dst = "<C-w>k", opts = { desc = "Move to Up Window ↑", noremap = true } },
    t = { src = "<A-f>", plugin = "keymap", dst = "<C-\\><C-n><C-w>k", opts = { desc = "Move to Up Window ↑", noremap = true } },
  },
  ["op_around"] = {
    x = { src = "y", plugin = "keymap", dst = "a", opts = { desc = "op_around" } },
    obj = { src = "y", plugin = "keymap", dst = "a", opts = { desc = "op_around" } },
  },
  ["op_inner"] = {
    x = { src = "i", plugin = "keymap", dst = "i", opts = { desc = "op_inner" } },
    obj = { src = "i", plugin = "keymap", dst = "i", opts = { desc = "op_inner" } },
  },
  ["op_next_start"] = {
    obj = { src = "n", plugin = "keymap", dst = "][", opts = { desc = "op_next" } },
    go = { src = "n", plugin = "keymap", dst = "][", opts = { desc = "op_next" } },
  },
  ["op_next_end"] = {
    obj = { src = "n", plugin = "keymap", dst = "]]", opts = { desc = "op_next" } },
    go = { src = "n", plugin = "keymap", dst = "]]", opts = { desc = "op_next" } },
  },
  ["op_prev_end"] = {
    obj = { src = "L", plugin = "keymap", dst = "[]", opts = { desc = "op_prev_end" } },
    go = { src = "L", plugin = "keymap", dst = "[]", opts = { desc = "op_prev_end" } },
  },
  ["op_prev_start"] = {
    obj = { src = "l", plugin = "keymap", dst = "[[", opts = { desc = "op_prev_start" } },
    go = { src = "l", plugin = "keymap", dst = "[[", opts = { desc = "op_prev_start" } },
  },
  ["op_surround"] = {
    x = { src = "s", plugin = "keymap", dst = "s", opts = { desc = "op_surround" } },
    obj = { src = "s", plugin = "keymap", dst = "s", opts = { desc = "op_surround" } },
  },
  ["verb_change"] = {
    n = { src = "n", plugin = "keymap", dst = "c", opts = { desc = "verb_change" } },
    x = { src = "n", plugin = "keymap", dst = "c", opts = { desc = "verb_change" } },
  },
  ["verb_comment"] = {
    n = { src = "q", plugin = "keymap", dst = "gc", opts = { desc = "verb_comment", noremap=false, remap=true } },
  },
  ["do_select_all"] = {
    n={ src="<C-a>", plugin="keymap", dst="ggVG", opts={desc="Select All", noremap=true}},
    i={ src="<C-a>", plugin="keymap", dst="<Esc>ggVG", opts={desc="Select All", noremap=true}},
    x={ src="<C-a>", plugin="keymap", dst="ggVG", opts={desc="Select All", noremap=true}},
    v={ src="<C-a>", plugin="keymap", dst="ggVG", opts={desc="Select All", noremap=true}},
    t={ src="<C-a>", plugin="keymap", dst="<C-\\><C-n>ggVG", opts={desc="Select All", noremap=true}},
},
["do_undo"] = {
    n={ src="<C-z>", plugin="keymap", dst="u", opts={desc="Undo", noremap=true}},
    i={ src="<C-z>", plugin="keymap", dst="<Esc>u", opts={desc="Undo", noremap=true}},
    x={ src="<C-z>", plugin="keymap", dst="u", opts={desc="Undo", noremap=true}},
    v={ src="<C-z>", plugin="keymap", dst="u", opts={desc="Undo", noremap=true}},
    t={ src="<C-z>", plugin="keymap", dst="<C-\\><C-n>u", opts={desc="Undo", noremap=true}},
},
["verb_cut"] = {
    n={ src="<C-x>", plugin="keymap", dst="\"+d", opts={desc="Cut", noremap=true}},
    i={ src="<C-x>", plugin="keymap", dst="<Esc>\"+d", opts={desc="Cut", noremap=true}},
    x={ src="<C-x>", plugin="keymap", dst="\"+d", opts={desc="Cut", noremap=true}},
    v={ src="<C-x>", plugin="keymap", dst="\"+d", opts={desc="Cut", noremap=true}},
    t={ src="<C-x>", plugin="keymap", dst="<C-\\><C-n>\"+d", opts={desc="Cut", noremap=true}},
},
["do_paste"] = {
    n={ src="<C-v>", plugin="keymap", dst="\"+p", opts={desc="Paste", noremap=true}},
    i={ src="<C-v>", plugin="keymap", dst="<Esc>\"+pa", opts={desc="Paste", noremap=true}},
    x={ src="<C-v>", plugin="keymap", dst="\"+p", opts={desc="Paste", noremap=true}},
    v={ src="<C-v>", plugin="keymap", dst="\"+p", opts={desc="Paste", noremap=true}},
    t={ src="<C-v>", plugin="keymap", dst="<C-\\><C-n>\"+p", opts={desc="Paste", noremap=true}},
},
["verb_copy"] = {
    n={ src="<C-c>", plugin="keymap", dst="\"+y", opts={desc="Copy", noremap=true}},
    i={ src="<C-c>", plugin="keymap", dst="<Esc>\"+y", opts={desc="Copy", noremap=true}},
    x={ src="<C-c>", plugin="keymap", dst="\"+y", opts={desc="Copy", noremap=true}},
    v={ src="<C-c>", plugin="keymap", dst="\"+y", opts={desc="Copy", noremap=true}},
    t={ src="<C-c>", plugin="keymap", dst="<C-\\><C-n>\"+y", opts={desc="Copy", noremap=true}},
},

  ["verb_delete"] = {
    n = { src = "d", plugin = "keymap", dst = "d", opts = { desc = "verb_delete" } },
    x = { src = "d", plugin = "keymap", dst = "d", opts = { desc = "verb_delete" } },
  },
  ["verb_go"] = {
    x = { src = "e", plugin = "keymap", dst = "e", opts = { desc = "verb_go" } },
  },
  ["verb_go_next"] = {
    n = { src = "e", plugin = "keymap", dst = "e", opts = { desc = "verb_go_next" } },
  },
  ["verb_go_prev"] = {
    n = { src = "E", plugin = "keymap", dst = "E", opts = { desc = "verb_go_prev" } },
    x = { src = "E", plugin = "keymap", dst = "E", opts = { desc = "verb_go_prev" } },
  },
  ["verb_indent"] = {
    n = { src = ">", plugin = "keymap", dst = ">", opts = { desc = "verb_indent" } },
    x = { src = ">", plugin = "keymap", dst = ">gv", opts = { desc = "verb_indent" } },
  },
  ["verb_unindent"] = {
    n = { src = "<", plugin = "keymap", dst = "<", opts = { desc = "verb_unindent" } },
    x = { src = "<", plugin = "keymap", dst = "<gv", opts = { desc = "verb_unindent" } },
  },
  ["verb_select"] = {
    n = { src = "a", plugin = "keymap", dst = "v", opts = { desc = "verb_select" } },
    x = { src = "a", plugin = "keymap", dst = "v", opts = { desc = "verb_select" } },
  },
  ["do_save_file"] = {
    n={ src="<C-s>", plugin="keymap", dst=":w<CR>", opts={desc="Save File", noremap=true, silent=true}},
    i={ src="<C-s>", plugin="keymap", dst="<Esc>:w<CR>a", opts={desc="Save File", noremap=true, silent=true}},
    v={ src="<C-s>", plugin="keymap", dst="<Esc>:w<CR>gv", opts={desc="Save File", noremap=true, silent=true}},
    x={ src="<C-s>", plugin="keymap", dst="<Esc>:w<CR>gv", opts={desc="Save File", noremap=true, silent=true}},
    o={ src="<C-s>", plugin="keymap", dst="<Esc>:w<CR>", opts={desc="Save File", noremap=true, silent=true}},
    t={ src="<C-s>", plugin="keymap", dst="<C-\\><C-n>:w<CR>", opts={desc="Save File", noremap=true, silent=true}},
},
["sys_previous_buffer"] = {
    n={ src="<A-w>", plugin="keymap", dst=":bprevious<CR>", opts={desc="Previous Buffer", noremap=true, silent=true}},
    i={ src="<A-w>", plugin="keymap", dst="<Esc>:bprevious<CR>a", opts={desc="Previous Buffer", noremap=true, silent=true}},
    v={ src="<A-w>", plugin="keymap", dst="<Esc>:bprevious<CR>gv", opts={desc="Previous Buffer", noremap=true, silent=true}},
    x={ src="<A-w>", plugin="keymap", dst="<Esc>:bprevious<CR>gv", opts={desc="Previous Buffer", noremap=true, silent=true}},
    o={ src="<A-w>", plugin="keymap", dst="<Esc>:bprevious<CR>", opts={desc="Previous Buffer", noremap=true, silent=true}},
    t={ src="<A-w>", plugin="keymap", dst="<C-\\><C-n>:bprevious<CR>", opts={desc="Previous Buffer", noremap=true, silent=true}},
},
["sys_next_buffer"] = {
    n={ src="<A-p>", plugin="keymap", dst=":bnext<CR>", opts={desc="Next Buffer", noremap=true, silent=true}},
    i={ src="<A-p>", plugin="keymap", dst="<Esc>:bnext<CR>a", opts={desc="Next Buffer", noremap=true, silent=true}},
    v={ src="<A-p>", plugin="keymap", dst="<Esc>:bnext<CR>gv", opts={desc="Next Buffer", noremap=true, silent=true}},
    x={ src="<A-p>", plugin="keymap", dst="<Esc>:bnext<CR>gv", opts={desc="Next Buffer", noremap=true, silent=true}},
    o={ src="<A-p>", plugin="keymap", dst="<Esc>:bnext<CR>", opts={desc="Next Buffer", noremap=true, silent=true}},
    t={ src="<A-p>", plugin="keymap", dst="<C-\\><C-n>:bnext<CR>", opts={desc="Next Buffer", noremap=true, silent=true}},
},

}
