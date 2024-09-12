-- bootstrap lazy.nvim, LazyVim and your plugins
--local feedkeys = vim.api.nvim_feedkeys
--local patched_feedkeys = function(keys, mode, kS)
--    local lmu = require('langmapper.utils')
--    local patched = lmu.translate_keycode(keys, 'default', 'cm')
--    return feedkeys(patched, mode, kS)
--end
--vim.api.nvim_feedkeys = patched_feedkeys
-- lmu.translate_keycode(prefix_i, 'default', 'ru')

require("config.lazy")
require("my-config.which-key").register_descriptions()

-- vim.keymap.set("n", "za", "za", { remap = true })
-- langmapper = require("langmapper")
-- langmapper.automapping({ buffer = false })