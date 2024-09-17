-- file: C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\keys2.lua
return {
  [","] = { nx = "mo_repeat_rfind" },
  ["."] = { nx = "mo_repeat_find" },
  [";"] = { nx = "do_repeat_last_cmd" },
  ["<"] = { nx = "verb_unindent" },
  [">"] = { nx = "verb_indent" },
  ["A"] = { nx = "do_select_line" },
  ["a"] = { nx = "verb_select" },
  ["B"] = { n = "do_replace_mode" },
  ["b"] = { n = "do_delete_char" },
  ["C"] = { n = "do_copy_eol" },
  ["c"] = { nx = "verb_copy" },
  ["D"] = { n = "do_delete_eol" },
  ["d"] = { nx = "verb_delete" },
  ["E"] = { nx = "do_nothing"},
  ["e"] = { nxo = "mo_find_pair"},  
  ["f"] = { nox = "mo_jump_to_line" },
  ["g"] = { nx = "do_g_prefix" },
  ["h"] = { nxo = "mo_prev_match" },
  ["I"] = { n = "do_insert_bol" },
  ["i"] = { n = "do_insert", x = "op_inner" },
  ["J"] = { n = "do_play_macro" },
  ["j"] = { n = "do_record_macro" },
  -- ["k"] = { nxo = "mo_next_match"   },
  ["k"] = { nox = "do_set_mark" },
  ["L"] = { nx = "do_nothing" },
  ["l"] = { nx = "mo_till_char" },
  ["m"] = { nox = "mo_next_match" },
  ["M"] = { nox = "mo_prev_match" },
  ["N"] = { n = "do_change_eol" },
  ["n"] = { nx = "verb_change" },
  ["o"] = { nx = "do_newline_insert" },
  ["<M-o>"] = { i = "do_newline_insert" },
  ["O"] = { nx = "do_newline_insert_before" },
  ["<M-O>"] = { i = "do_newline_insert_before" },
  -- p
  ["Q"] = { n = "do_comment_line" },
  ["q"] = { n = "verb_comment" },
  ["<M-q>"] = { i = "do_comment_line" },
  ["R"] = { nox = "mo_rfind_char" },
  ["r"] = { nox = "mo_rtill_char" },
  
  ["s"] = { nox = "prefix_motion_menu" },
  ["sa"] = { nox = "mo_bol" },
  ["sr"] = { nox = "mo_bol_nonblank" },
  ["st"] = { nox = "mo_eol" },
  ["sw"] = { nox = "mo_start_of_word" },
  ["sf"] = { nox = "do_scroll_up_3" }, -- Scroll screen up by 3 lines
  ["sF"] = { nox = "do_scroll_up_1" }, -- Scroll screen up by 1 line
  ["ss"] = { nox = "do_scroll_down_3" }, -- Scroll screen down by 3 lines
  ["sS"] = { nox = "do_scroll_down_1" }, -- Scroll screen down by 1 line
  ["sp"] = { nox = "mo_last_jump" }, -- Jump to last jump (``)
  ["si"] = { nox = "mo_last_change" }, -- Jump to last change (`")
  ["sy"] = { nox = "mo_last_insert" }, -- Jump to last insert (`.)
  ["s,"] = { nox = "mo_prev_jump_list" }, -- Go to previous jump list (Ctrl+O)
  ["s."] = { nox = "mo_next_jump_list" }, -- Go to next jump list (Ctrl+I)
  ["s<"] = { nox = "mo_prev_change_list" }, -- Go to previous change list (g;)
  ["s>"] = { nox = "mo_next_change_list" }, -- Go to next change list (g,)
  ["p"] = { nox = "mo_matching_pair" }, -- Jump to matching pair (%)
  
  ["sb"] = { nox = "mo_prev_start_of_word" },
  ["se"] = { nox = "mo_end_of_word" },
  ["T"] = { nox = "mo_find_char" },
  ["t"] = { nox = "mo_till_char" },
  ["U"] = { nx = "mo_ts_find" },
  ["u"] = { nx = "do_ts_select" },
  ["V"] = { n = "do_paste_before" },
  ["v"] = { n = "do_paste" },
  ["W"] = { n = "do_redo" },
  ["w"] = { n = "do_undo" },
  ["<M-W>"] = { i = "do_redo" },
  ["<M-w>"] = { i = "do_undo" },
  ["X"] = { n = "do_cut_eol" },
  ["x"] = { nx = "verb_cut" },
  ["Y"] = { n = "do_append_eol" },
  ["y"] = { x = "op_around", n = "do_append" },
  ["z"] = { nx = "do_z_prefix" },
  -- ["<CR>"] = { nox = "mo_next_match" }, -- Enter (next match)
  -- ["<S-CR>"] = { nox = "mo_prev_match" }, -- Shift+Enter (previous match)
  ["<A-u>"] = { inotvx = "sys_window_up" },
  ["<A-n>"] = { inotvx = "sys_window_left" },
  ["<A-e>"] = { inotvx = "sys_window_down" },
  ["<A-i>"] = { inotvx = "sys_window_right" },
  ["<A-f>"] = { inotvx = "mo_up" },
  ["<A-r>"] = { inotvx = "mo_left" },
  ["<A-s>"] = { inotvx = "mo_down" },
  ["<A-t>"] = { inotvx = "mo_right" },

  ["<A-p>"] = { inotvx = "sys_next_buffer" },
  ["<A-w>"] = { inotvx = "sys_previous_buffer" },
  ["<C-a>"] = { intvx = "do_select_all" },
  ["<C-c>"] = { intvx = "verb_copy" },
  ["<C-s>"] = { inotvx = "do_save_file" },
  ["<C-v>"] = { cinotvx = "do_paste" },
  ["<C-x>"] = { intvx = "verb_cut" },
  ["<C-z>"] = { intvx = "do_undo" },
}
