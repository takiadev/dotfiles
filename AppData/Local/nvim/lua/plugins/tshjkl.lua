return {
    'gsuuon/tshjkl.nvim',
    keys = {
        {'<leader>ct', mode={'n', 'x'}, desc="Open TS-HJKL mode"},
    },
    opts = {
      -- false to highlight only. Note that enabling this will hide the highlighting of child nodes
      select_current_node = false,
      keymaps = {
        toggle = '<leader>ct',
      },
      marks = {
        parent = {
          virt_text = { {'h', 'ModeMsg'} },
          virt_text_pos = 'overlay'
        },
        child = {
          virt_text = { {'l', 'ModeMsg'} },
          virt_text_pos = 'overlay'
        },
        prev = {
          virt_text = { {'k', 'ModeMsg'} },
          virt_text_pos = 'overlay'
        },
        next = {
          virt_text = { {'j', 'ModeMsg'} },
          virt_text_pos = 'overlay'
        }
      },
      binds = function(bind, tshjkl)
        bind('<Esc>', function()
          tshjkl.exit(true)
        end)
  
        bind('q', function()
          tshjkl.exit(true)
        end)
  
        bind('t', function()
          print(tshjkl.current_node():type())
        end)
      end,
    }
  }