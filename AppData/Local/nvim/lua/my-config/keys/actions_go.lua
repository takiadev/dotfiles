-- file: C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions_go.lua
return {
  a_block = {
    go = { src = "b", plugin = nil, dst = , opts = { desc = "a_block" } },
  },
  a_comment = {
    go = { src = "q", plugin = nil, dst = , opts = { desc = "a_comment" } },
  },
  a_comment_block = {
    go = { src = "Q", plugin = nil, dst = , opts = { desc = "comment_block" } },
  },
  a_condition = {
    go = { src = "c", plugin = nil, dst = , opts = { desc = "a_condition" } },
  },
  a_function = {
    go = { src = "f", plugin = nil, dst = , opts = { desc = "a_function" } },
  },
  a_function_call = {
    go = { src = "F", plugin = nil, dst = , opts = { desc = "a_function_call" } },
  },
  a_loop = {
    go = { src = "r", plugin = nil, dst = , opts = { desc = "a_loop" } },
  },
  a_paragraph = {
    go = { src = "p", plugin = nil, dst = , opts = { desc = "a_paragraph" } },
  },
  a_type = {
    go = { src = "t", plugin = nil, dst = , opts = { desc = "a_type" } },
  },
  a_variable = {
    go = { src = "v", plugin = nil, dst = , opts = { desc = "a_variable" } },
  },
  a_word = {
    go = { src = "W", plugin = nil, dst = , opts = { desc = "a_word" } },
  },
  op_next_end = {
    go = { src = "n", plugin = "keymap", dst = "]]", opts = { desc = "op_next" } },
  },
  op_next_start = {
    go = { src = "n", plugin = "keymap", dst = "][", opts = { desc = "op_next" } },
  },
  op_prev_end = {
    go = { src = "L", plugin = "keymap", dst = "[]", opts = { desc = "op_prev_end" } },
  },
  op_prev_start = {
    go = { src = "l", plugin = "keymap", dst = "[[", opts = { desc = "op_prev_start" } },
  },
}
