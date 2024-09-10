return {
  {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {},},
  {"Mofiqul/vscode.nvim", lazy = false, priority = 1000,},
  {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            transparent_background = false,
            nvim_tree_darker = true,
        })
    end,
  },
  --{"catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000},
  --{"rebelot/kanagawa.nvim", lazy=false, priority=1000,},
  --{"navarasu/onedark.nvim", lazy=false, priority=1000, 
  --config=function()
  --  require('onedark').setup {
  --      style = 'darker'
  --  }  
  --end},
}