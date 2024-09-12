return {
--[[
  {
    'Wansmer/langmapper.nvim',
    enabled = false,
    lazy = false,
    priority = 1, -- High priority is needed if you will use `autoremap()`
    config = function()
      L = require('config.langmap')
      require('langmapper').setup({
        default_layout =  L.en,
        layouts = {cm = {
                layout =  L.cm,
            id = 'colemak',
            default_layout = nil,
          },
        },
        os = {}
      })
    end,
  },
  {
    'folke/which-key.nvim',
    enabled = true,
    debug = true,
    dependencies = { 'Wansmer/langmapper.nvim' },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
  
      -- local lmu = require('langmapper.utils')
      local view = require('which-key.state')
      local execute = view.execute
  
      -- wrap `execute()` and translate sequence back
      view.execute = function(state, key, node)
        -- Translate back to English characters
        local patched = key -- lmu.translate_keycode(key, 'default', 'cm')
        print("Key: " .. key .. " -> " .. patched)
        -- wk.notify("Key: " .. key .. " -> " .. patched)
        execute(state, patched, node)
      end
  
      -- If you want to see translated operators, text objects and motions in
      -- which-key prompt
      -- local presets = require('which-key.plugins.presets')
      -- presets.operators = lmu.trans_dict(presets.operators)
      -- presets.objects = lmu.trans_dict(presets.objects)
      -- presets.motions = lmu.trans_dict(presets.motions)
      -- etc
  
      require('which-key').setup()
    end,
  }
  --]]
}