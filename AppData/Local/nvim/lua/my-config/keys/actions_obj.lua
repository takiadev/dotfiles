-- file: C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions_obj.lua
return {
  a_WORD = {
    obj = { src = "W", plugin = nil, dst = , opts = { desc = "a_WORD" } },
  },
  a_block = {
    obj = { src = "b", plugin = nil, dst = , opts = { desc = "a_block" } },
  },
  a_comment = {
    obj = { src = "q", plugin = nil, dst = , opts = { desc = "a_comment" } },
  },
  a_comment_block = {
    obj = { src = "Q", plugin = nil, dst = , opts = { desc = "comment_block" } },
  },
  a_condition = {
    obj = { src = "c", plugin = nil, dst = , opts = { desc = "a_condition" } },
  },
  a_function = {
    obj = { src = "f", plugin = nil, dst = , opts = { desc = "a_function" } },
  },
  a_function_call = {
    obj = { src = "F", plugin = nil, dst = , opts = { desc = "a_function_call" } },
  },
  a_loop = {
    obj = { src = "r", plugin = nil, dst = , opts = { desc = "a_loop" } },
  },
  a_paragraph = {
    obj = { src = "p", plugin = nil, dst = , opts = { desc = "a_paragraph" } },
  },
  a_type = {
    obj = { src = "t", plugin = nil, dst = , opts = { desc = "a_type" } },
  },
  a_variable = {
    obj = { src = "v", plugin = nil, dst = , opts = { desc = "a_variable" } },
  },
  a_word = {
    obj = { src = "w", plugin = nil, dst = , opts = { desc = "a_word" } },
  },
  do_g_prefix = {
    obj = { src = "g", plugin = "keymap", dst = "g", opts = { desc = "do_g_prefix" } },
  },
  op_around = {
    obj = { src = "y", plugin = "keymap", dst = "a", opts = { desc = "op_around" } },
  },
  op_inner = {
    obj = { src = "i", plugin = "keymap", dst = "i", opts = { desc = "op_inner" } },
  },
  op_next_end = {
    obj = { src = "n", plugin = "keymap", dst = "]]", opts = { desc = "op_next" } },
  },
  op_next_start = {
    obj = { src = "n", plugin = "keymap", dst = "][", opts = { desc = "op_next" } },
  },
  op_prev_end = {
    obj = { src = "L", plugin = "keymap", dst = "[]", opts = { desc = "op_prev_end" } },
  },
  op_prev_start = {
    obj = { src = "l", plugin = "keymap", dst = "[[", opts = { desc = "op_prev_start" } },
  },
  op_surround = {
    obj = { src = "s", plugin = "keymap", dst = "s", opts = { desc = "op_surround" } },
  },
}
