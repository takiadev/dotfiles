return {
  ["q"] = {
    n = "verb_comment",
    obj = "a_comment",
    go = "a_comment",
  },
  ["Q"] = {
    n = "do_comment_line",
    obj = "a_comment_block",
    go = "a_comment_block",
  },
  ["w"] = {
    n = "do_undo",
    obj = "a_word",
    go = "a_word",
  },
  ["W"] = {
    n = "do_redo",
    obj = "a_WORD",
    go = "a_word",
  },
  ["f"] = {
    n = "mo_up",
    x = "mo_up",
    o = "mo_up",
    obj = "a_function",
    go = "a_function",
  },
  ["F"] = {
    obj = "a_function_call",
    go = "a_function_call",
  },
  ["p"] = {
    obj = "a_paragraph",
    go = "a_paragraph",
  },
  ["P"] = {},
  ["g"] = {
    n = "do_g_prefix",
    x = "do_g_prefix",
    obj = "do_g_prefix",
  },
  ["G"] = {},
  ["j"] = {
    n = "do_record_macro",
  },
  ["J"] = {
    n = "do_play_macro",
  },
  ["l"] = {
    n = "mo_find_char",
    x = "mo_find_char",
    obj = "op_prev_start",
    go = "op_prev_start",
  },
  ["L"] = {
    n = "mo_rfind_char",
    x = "mo_rfind_char",
    obj = "op_prev_end",
    go = "op_prev_end",
  },
  ["u"] = {
    n = "mo_ultra_find",
    x = "mo_ultra_find",
  },
  ["U"] = {
    n = "mo_ultra_rfind",
    x = "mo_ultra_rfind",
  },
  ["y"] = {
    n = "do_append",
    x = "op_around",
    obj = "op_around",
  },
  ["Y"] = {
    n = "do_append_eol",
  },
  [";"] = {
    n = "do_repeat_last_cmd",
    x = "do_repeat_last_cmd",
  },
  ["a"] = {
    n = "verb_select",
    x = "verb_select",
  },
  ["A"] = {
    n = "do_select_line",
    x = "do_select_line",
  },
  ["r"] = {
    n = "mo_left",
    x = "mo_left",
    o = "mo_left",
    obj = "a_loop",
    go = "a_loop",
  },
  ["R"] = {
    n = "mo_screen_top",
    x = "mo_screen_top",
    o = "mo_screen_top",
  },
  ["s"] = {
    n = "mo_down",
    x = "mo_down",
    o = "mo_down",
    obj = "op_surround",
    go = "mo_matching_char",
  },
  ["S"] = {},
  ["t"] = {
    n = "mo_right",
    x = "mo_right",
    o = "mo_right",
    obj = "a_type",
    go = "a_type",
  },
  ["T"] = {
    n = "mo_screen_bottom",
    x = "mo_screen_bottom",
    o = "mo_screen_bottom",
  },
  ["d"] = {
    n = "verb_delete",
    x = "verb_delete",
  },
  ["D"] = {
    n = "do_delete_eol",
  },
  ["n"] = {
    n = "verb_change",
    x = "verb_change",
    obj = "op_next_start",
    go = "op_next_start",
  },
  ["N"] = {
    n = "do_change_eol",
    obj = "op_next_end",
    go = "op_next_end",
  },
  ["e"] = {
    n = "verb_go_next",
    x = "verb_go",
  },
  ["E"] = {
    n = "verb_go_prev",
    x = "verb_go_prev",
  },
  ["i"] = {
    n = "do_insert",
    x = "op_inner",
    obj = "op_inner",
  },
  ["I"] = {
    n = "do_insert_bol",
  },
  ["z"] = {
    n = "do_z_prefix",
    x = "do_z_prefix",
    obj = "do_z_prefix",
  },
  ["Z"] = {},
  ["x"] = {
    n = "verb_cut",
    x = "verb_cut",
  },
  ["X"] = {
    n = "do_cut_eol",
  },
  ["c"] = {
    n = "verb_copy",
    x = "verb_copy",
    obj = "a_condition",
    go = "a_condition",
  },
  ["C"] = {
    n = "do_copy_eol",
  },
  ["v"] = {
    n = "do_paste",
    obj = "a_variable",
    go = "a_variable",
  },
  ["V"] = {
    n = "do_paste_before",
  },
  ["b"] = {
    n = "do_delete_char",
    obj = "a_block",
    go = "a_block",
  },
  ["B"] = {
    n = "do_replace_mode",
  },
  ["m"] = {
    n = "do_set_mark",
    x = "do_set_mark",
    go = "m_jump_to_mark",
  },
  ["M"] = {},
  [","] = {
    n = "mo_repeat_rfind",
    x = "mo_repeat_rfind",
  },
  ["."] = {
    n = "mo_repeat_find",
    x = "mo_repeat_find",
  },
  ["<"] = {
    n = "verb_unindent",
    x = "verb_unindent",
  },
  [">"] = {
    n = "verb_indent",
    x = "verb_indent",
  },
  ["<A-r>"] = {
    n = "sys_window_left",
    i = "sys_window_left",
    x = "sys_window_left",
    v = "sys_window_left",
    o = "sys_window_left",
    t = "sys_window_left",
  },
  ["<A-s>"] = {
    n = "sys_window_down",
    i = "sys_window_down",
    x = "sys_window_down",
    v = "sys_window_down",
    o = "sys_window_down",
    t = "sys_window_down",
  },
  ["<A-t>"] = {
    n = "sys_window_right",
    i = "sys_window_right",
    x = "sys_window_right",
    v = "sys_window_right",
    o = "sys_window_right",
    t = "sys_window_right",
  },
  ["<A-f>"] = {
    n = "sys_window_up",
    i = "sys_window_up",
    x = "sys_window_up",
    v = "sys_window_up",
    o = "sys_window_up",
    t = "sys_window_up",
  },
  ["<C-a>"] = {
    n="do_select_all",
    i="do_select_all",
    x="do_select_all",
    v="do_select_all",
    t="do_select_all",
},
["<C-z>"] = {
    n="do_undo",
    i="do_undo",
    x="do_undo",
    v="do_undo",
    t="do_undo",
},
["<C-x>"] = {
    n="verb_cut",
    i="verb_cut",
    x="verb_cut",
    v="verb_cut",
    t="verb_cut",
},
["<C-v>"] = {
    n="do_paste",
    i="do_paste",
    x="do_paste",
    v="do_paste",
    t="do_paste",
},
["<C-c>"] = {
    n="verb_copy",
    i="verb_copy",
    x="verb_copy",
    v="verb_copy",
    t="verb_copy",
},
["<C-s>"] = {
    n="do_save_file",
    i="do_save_file",
    v="do_save_file",
    x="do_save_file",
    o="do_save_file",
    t="do_save_file",
},
["<A-w>"] = {
    n="sys_previous_buffer",
    i="sys_previous_buffer",
    v="sys_previous_buffer",
    x="sys_previous_buffer",
    o="sys_previous_buffer",
    t="sys_previous_buffer",
},
["<A-p>"] = {
    n="sys_next_buffer",
    i="sys_next_buffer",
    v="sys_next_buffer",
    x="sys_next_buffer",
    o="sys_next_buffer",
    t="sys_next_buffer",
},



}
