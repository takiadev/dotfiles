local TO = require("my-config.textobjects")
local to = TO.textobjects()

local Keys = require("my-config.keymaps")
local surround_prefix = Keys.get_key("mini-surround", "prefix")

local H = {}
H.expr_motion = function(side)
  if H.is_disabled() then return '' end

  if not (side == 'left' or side == 'right') then H.error([[`side` should be one of 'left' or 'right'.]]) end

  -- Get user input
  local tobj_id = H.user_textobject_id('a')
  if tobj_id == nil then return end

  -- Clear cache
  H.cache = {}

  -- Make expression for moving cursor
  return '<Cmd>lua '
    .. string.format(
      [[MiniAi.move_cursor('%s', 'a', '%s', { n_times = %d })]],
      side,
      vim.fn.escape(tobj_id, "'\\"),
      vim.v.count1
    )
    .. '<CR>'
end


return {
{
    "echasnovski/mini.ai",
    opts = function()
      local ai = require("mini.ai")
      return {
        mappings = {
            -- Main textobject prefixes
            around = to.around,
            inside = to.inside,
        
            -- Next/last variants
            around_next = to.around .. to.next,
            inside_next = to.inside .. to.next,
            around_last = to.around .. to.last,
            inside_last = to.inside .. to.last,
        
            -- Move cursor to corresponding edge of `a` textobject
            -- Note: treesitter:move should take precedence here
            goto_left = "", -- to.go_to .. to.next,
            goto_right = "", -- to.go_to_end .. to.next,
        },
        n_lines = 500,
        custom_textobjects = to.mini_ai(),
      }
    end,
},
{
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "<plug>(mini-surround-add)", -- Add surrounding in Normal and Visual modes
      delete = "<plug>(mini-surround-delete)", -- Delete surrounding
      find = "<plug>(mini-surround-find-right)", -- Find surrounding (to the right)
      find_left = "<plug>(mini-surround-find-left)", -- Find surrounding (to the left)
      highlight = "<plug>(mini-surround-highlight)", -- Highlight surrounding
      replace = "<plug>(mini-surround-replace)", -- Replace surrounding
      update_n_lines = "<plug>(mini-surround-lines)", -- Update `n_lines`
    },
  },
},
}
