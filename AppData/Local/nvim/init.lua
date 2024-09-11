--
keymaps = require("config.keymaps")
keymaps.set_leader_keys()
keymaps.set()
--]]


textobjects = require("config.textobjects")
textobjects.set()

require("config.lazy")
-- require("config.keymaps2").set()

keymaps.configure_which_key_plugin()
textobjects.configure_which_key_plugin()

-- ['p']     = {['nxo']  = {'' ,        kind='m',       desc='Flash jump'             , expr=flash_jump    }},
-- ['P']     = {['nxo']  = {'' ,        kind='m',       desc='Flash Treesitter'       , expr=flash_treesitter  }},
--[[

--]]
----------------------------------------------

vim.o.background = 'dark'
vim.cmd.colorscheme("tokyonight")
local opt = vim.opt
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.swapfile = false
opt.number = true
opt.relativenumber = false
opt.cursorline = true
-- opt.signcolumn = 'yes'
-- opt.foldcolumn = '1'
-- opt.foldmethod = 'indent'
--]]
