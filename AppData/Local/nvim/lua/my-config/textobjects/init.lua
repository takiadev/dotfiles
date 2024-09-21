local module = {}
local Objects = require("my-config.textobjects.extra")

module.native_objects = {
  { '"', desc = 'String "..."' },
  { "'", desc = "String '...'" },
  { "(", desc = "Block []()" },
  { ")", desc = "Block []()" },
  { "<", desc = "Block <>" },
  { ">", desc = "Block <>" },
  { "B", desc = "Block []{}" },
  { "W", desc = "WORD" },
  { "[", desc = "Block []" },
  { "]", desc = "Block []" },
  { "`", desc = "String `...`" },
  { "b", desc = "Block []()" },
  { "p", desc = "Paragraph" },
  { "s", desc = "Sentence" },
  { "t", desc = "Tag block" },
  { "w", desc = "Word" },
  { "{", desc = "Block []{}" },
  { "}", desc = "Block []{}" },
}

function set_motion_mappings(to, k)
  -- define next jump like nf (to next function)
  vim.keymap.set({ "n", "x", "o" }, to.go_next_start_around .. k, function()
    return MiniAi.move_cursor("left", "a", k, { search_method = "next" })
  end, { silent = true })
  vim.keymap.set({ "n", "x", "o" }, to.go_next_end_around .. k, function()
    return MiniAi.move_cursor("right", "a", k, { search_method = "cover_or_next" })
  end, { silent = true })
  vim.keymap.set({ "n", "x", "o" }, to.go_next_start_inside .. k, function()
    return MiniAi.move_cursor("left", "i", k, { search_method = "next" })
  end, { silent = true })
  vim.keymap.set({ "n", "x", "o" }, to.go_next_end_inside .. k, function()
    return MiniAi.move_cursor("right", "i", k, { search_method = "cover_or_next" })
  end, { silent = true })

  -- define last jump like mf (to last function)
  vim.keymap.set({ "n", "x", "o" }, to.go_prev_start_around .. k, function()
    return MiniAi.move_cursor("left", "a", k, { search_method = "cover_or_prev" })
  end, { silent = true })
  vim.keymap.set({ "n", "x", "o" }, to.go_prev_end_around .. k, function()
    return MiniAi.move_cursor("right", "a", k, { search_method = "prev" })
  end, { silent = true })
  vim.keymap.set({ "n", "x", "o" }, to.go_prev_start_inside .. k, function()
    return MiniAi.move_cursor("left", "i", k, { search_method = "cover_or_prev" })
  end, { silent = true })
  vim.keymap.set({ "n", "x", "o" }, to.go_prev_end_inside .. k, function()
    return MiniAi.move_cursor("right", "i", k, { search_method = "prev" })
  end, { silent = true })
end

function module.set()
  for _, o in pairs(module.native_objects) do
    local src = "a" .. o[1]
    local dst = "y" .. o[1]
    vim.keymap.set({ "o", "x" }, src, dst, { remap = true, desc = "around " .. o["desc"] })
  end

  -- line textobject
  -- todo cleanup
  vim.keymap.set({ "x", "o" }, "at", ":<c-u>normal! $v0<cr>", { noremap = true, silent = true, desc = "Line" })
  vim.keymap.set({ "x", "o" }, "it", ":<c-u>normal! $v^<cr>", { noremap = true, silent = true, desc = "Line" })
  vim.keymap.set({ "x", "o" }, "t", ":<c-u>normal! V<cr>", { noremap = true, silent = true, desc = "Line" })
  vim.keymap.set({ "n" }, "tt", "V", { noremap = true, silent = true, desc = "Select line" })

  vim.keymap.set({ "x", "o", "n" }, "l", "<plug>(matchup-%)", { remap = true })
  vim.keymap.set({ "x", "o", "n" }, "gl", "<plug>(matchup-g%)", { remap = true })
  vim.keymap.set({ "n", "x", "o" }, "]l", "<plug>(matchup-]%)", { remap = true })
  vim.keymap.set({ "n", "x", "o" }, "[l", "<plug>(matchup-[%)", { remap = true })
  vim.keymap.set({ "x", "o" }, "il", "<plug>(matchup-i%)", { remap = true })
  vim.keymap.set({ "x", "o" }, "yl", "<plug>(matchup-a%)", { remap = true })
  vim.keymap.set({ "x", "o" }, "ol", "<plug>(matchup-s%)", { remap = true })
  vim.keymap.set({ "n" }, "sol", "<plug>(matchup-ds%)", { remap = true })
  vim.keymap.set({ "n" }, "dol", "<plug>(matchup-ds%)", { remap = true })
  vim.keymap.set({ "n" }, "rol", "<plug>(matchup-cs%)", { remap = true })

  local MiniAi = require("mini.ai")
  local to = module.textobjects()
  local ai_objects = to.mini_ai()
  no_shortcut = { [to._end] = true, [to.inside] = true, [to.around] = true }
  for k, v in pairs(ai_objects) do
    if no_shortcut[k] then
      print("TextObjects: Warning collision with key " .. k)
    end

    set_motion_mappings(to, k)
  end
  set_motion_mappings(to, "q")
  set_motion_mappings(to, "b")
end

function module.configure_which_key_plugin()
  local wk = require("which-key")
  wk.add({
    mode = { "x", "o" },
    { "i", group = "inner", icon = "" },
    { "y", group = "around", icon = "" },
  })
  for _, v in pairs(module.native_objects) do
    local o = v[1]
    local desc = v["desc"]
    wk.add({ "a" .. o, mode = { "x", "o" }, desc = desc })
  end
end

function module.textobjects()
  local ai = require("mini.ai")
  local result = {
    inside = "i",
    around = "y",
    _end = "e",
    around_next = "yn",
    around_prev = "ym",
    inside_next = "in",
    inside_prev = "im",
    go_next_start_around = "n",
    go_next_start_inside = "ni",
    go_next_end_around = "ne",
    go_next_end_inside = "nei",
    go_prev_start_around = "m",
    go_prev_start_inside = "mi",
    go_prev_end_around = "me",
    go_prev_end_inside = "mei",

    treesitter = {
      a = { a = "@parameter.outer", i = "@parameter.inner" },
      A = { a = "@assignment.outer", i = "@assignment.rhs" },
      b = { a = "@block.outer", i = "@block.inner" },
      s = { a = "@conditional.outer", i = "@conditional.inner" }, -- switch
      f = { a = "@function.outer", i = "@function.inner" },
      x = { a = "@class.outer", i = "@class.inner" },
      r = { a = "@loop.outer", i = "@loop.inner" },
      R = { a = "@return.outer", i = "@return.inner" },
      v = { a = "@call.outer", i = "@call.inner" },
    },
    ai_extra = {
      g = Objects.buffer(),
      -- l = Objects.line(),
      c = Objects.comment(),
      q = nil, -- q: quote alias defined by mini.ai
      b = nil, -- b: block alias defined by mini.ai
      d = { "%f[%d]%d+" }, -- digit
      --   t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
      --   e = { -- Word with case
      --     { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
      --     "^().*()$",
      --   },
      --   i = LazyVim.mini.ai_indent, -- indent
      --   u = ai.gen_spec.function_call(), -- u for "Usage"
      V = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
    },
  }
  result.mini_ai = function()
    -- build text mini.ai specification
    local objects = {}

    local ai = require("mini.ai")
    for key, data in pairs(result.treesitter) do
      objects[key] = ai.gen_spec.treesitter(data)
    end

    objects = vim.tbl_extend("error", objects, result.ai_extra)
    return objects
  end
  -- result.treesitter_textobjects = function()
  --     local move = {
  --         enable=true,
  --         goto_next_start={},
  --         goto_next_end={},
  --         goto_previous_start={},
  --         goto_previous_end={},
  --     }

  --     for k, v in pairs(result.treesitter) do
  --         move.goto_next_start[result.go_to .. result.next .. k] = v.a
  --         move.goto_next_start[result.go_to .. result.next .. result.inside .. k] = v.i
  --         move.goto_next_end[result.go_to_end .. result.next .. k] = v.a
  --         move.goto_next_end[result.go_to_end .. result.next .. result.inside .. k] = v.i
  --         move.goto_previous_start[result.go_to .. result.last .. k] = v.a
  --         move.goto_previous_start[result.go_to .. result.last .. result.inside .. k] = v.i
  --         move.goto_previous_end[result.go_to_end .. result.last .. k] = v.a
  --         move.goto_previous_end[result.go_to_end .. result.last .. result.inside .. k] = v.i
  --     end
  --     return {move=move}
  -- end

  local seen = {}
  local function traverse(objects)
    for k, v in pairs(objects) do
      seen[k] = (seen[k] or 0) + 1
    end
  end
  traverse(result)
  traverse(result.treesitter)
  traverse(result.ai_extra)
  for k, v in pairs(seen) do
    if v > 1 then
      print("Textobjects: Conflict for key " .. k .. ": " .. v .. " candidates")
    end
  end
  return result
end

return module

