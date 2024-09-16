# Requirements

- Install **Consolas NF** font, either by [generating it yourself](https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#font-patcher) or download it [from here](https://github.com/wclr/my-nerd-fonts/tree/80bf242a5131e44f71fc878a1f831efbdb62c36d)

```
# Terminal

choco install wezterm -y

# Additional tools for Neovim
choco install ripgrep
choco install fd
choco install lazygit
choco install luarocks
choco install gzip
```

You also need to install treesitter, see [Installing Treesitter properly in Windows 11](https://takia.dev/nvim-treesitter-windows-11/)

# Troubleshooting

Lua rocks says

```
You may want to add the following elements to your paths;
Lua interpreter;
  PATH     :   C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32
  PATHEXT  :   .LUA
LuaRocks;
  PATH     :   C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32
  LUA_PATH :   C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\lua\?.lua;C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\lua\?\init.lua
Local user rocktree (Note: %APPDATA% is user dependent);
  PATH     :   %APPDATA%\LuaRocks\bin
  LUA_PATH :   %APPDATA%\LuaRocks\share\lua\5.1\?.lua;%APPDATA%\LuaRocks\share\lua\5.1\?\init.lua
  LUA_CPATH:   %APPDATA%\LuaRocks\lib\lua\5.1\?.dll
System rocktree
  PATH     :   C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\systree\bin
  LUA_PATH :   C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\systree\share\lua\5.1\?.lua;C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\systree\share\lua\5.1\?\init.lua
  LUA_CPATH:   C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\systree\lib\lua\5.1\?.dll

Note that the %APPDATA% element in the paths above is user specific and it MUST be replaced by its actual value.
For the current user that value is: C:\Users\Julien\AppData\Roaming.
``` 
