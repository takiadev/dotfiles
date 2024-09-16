local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)


function scheme_for_appearance(appearance)
	if appearance:find "Dark" then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end
-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider


---------------------------------------------------------------------------
---- HANDLE CTRL KEYS FORWARDING

local function signal_factory(signal)
	local function signal_handler(win, pane)
	  win:perform_action(wezterm.action.SendString(signal), pane)
	end
	return signal_handler
  end
  
  local function ctrl_c_handler(win, pane)
	local selection_text = win:get_selection_text_for_pane(pane)
	local is_selection_active = string.len(selection_text) ~= 0
	if is_selection_active then
	  win:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
	else
	  -- default to sending Ctrl+C signal
	  local handler = signal_factory("\x03")
	  return handler(win, pane) -- Invoke the signal handler
	end
  end
  
  local signal_mappings = {
	["c"] = { ["CTRL"] = {signal=ctrl_c_handler, nvim=true} }, -- Ctrl+C (Interrupt)
	["z"] = { ["CTRL"] = {signal=signal_factory("\x1A"), nvim=true} }, -- Ctrl+Z (Suspend)
	["d"] = { ["CTRL"] = {signal=signal_factory("\x04"), nvim=true} }, -- Ctrl+D (EOF)
	["s"] = { ["CTRL"] = {signal=signal_factory("\x13"), nvim=true} }, -- Ctrl+S (XOFF)
	["q"] = { ["CTRL"] = {signal=signal_factory("\x11"), nvim=true} }, -- Ctrl+Q (XON)
	["\\"] = { ["CTRL"] = {signal=signal_factory("\x1C"), nvim=true} }, -- Ctrl+\
  }
  
  -- Detect if Neovim is running by checking the process name
  local function is_neovim(pane)
	local process_name = pane:get_foreground_process_name()
	if process_name == nil then
	  return false
	end
	return process_name:find("nvim") ~= nil
  end
	
  -- Helper function to create mappings for regular keys and signals
  local function create_mapping(key, mods)
	return {
	  key = key,
	  mods = mods,
	  action = wezterm.action_callback(function(win, pane)
		if signal_mappings[key] and signal_mappings[key][mods] then
		  local signal_info = signal_mappings[key][mods]
		  if is_neovim(pane) then
			if signal_info.nvim then
			  -- Send the signal to Neovim
			  return signal_info.signal(win, pane)
			else
			  -- Forward the key to Neovim (don't send the signal)
			  win:perform_action(wezterm.action.SendKey { key = key, mods = mods }, pane)
			end
		  else
			-- Send the signal to the terminal program if not Neovim
			return signal_info.signal(win, pane)
		  end
		else
		  -- If not a signal, send the key normally
		  win:perform_action(wezterm.action.SendKey { key = key, mods = mods }, pane)
		end
	  end),
	}
  end
  

local keys_to_map = {"LeftArrow", "RightArrow", "UpArrow", "DownArrow"}
local all_letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
for letter in all_letters:gmatch('.') do
	table.insert(keys_to_map, letter)
end

local nvim_keys = {}
for _, key in ipairs(keys_to_map) do
	table.insert(nvim_keys, create_mapping(key, "ALT"))
	table.insert(nvim_keys, create_mapping(key, "CTRL"))
	table.insert(nvim_keys, create_mapping(key, "ALT|SHIFT"))
	table.insert(nvim_keys, create_mapping(key, "CTRL|SHIFT"))
end

---------------------------------------------------------------------------

local config = {
	allow_win32_input_mode = false,
	font = wezterm.font("Consolas NF"),
	default_prog = { "pwsh.exe", "-NoLogo" },
	color_scheme = 'Vs Code Dark+ (Gogh)', -- 'Alabaster', "tokyonight_day",
	hide_tab_bar_if_only_one_tab = false,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	use_fancy_tab_bar=false,
	window_frame = {
		font = wezterm.font { family = 'Consolas NF', weight = 'Bold' },	
	  	font_size = 12.0,
	  	-- active_titlebar_bg = "#7aa2f7",
	  	-- inactive_titlebar_bg = "#292e42",
	},
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	-- debug_key_events = true,
	mouse_bindings = {
		{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
		},
	},
	keys = nvim_keys,
	--[[other = {
		{
			key = 'c',
			mods = 'CTRL',
			action = wezterm.action_callback(function(window, pane)
				selection_text = window:get_selection_text_for_pane(pane)
				is_selection_active = string.len(selection_text) ~= 0
				if is_selection_active then
					window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
				else
					window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
				end
			end),
		},
		{ key = ' ', mods = 'CTRL', action = wezterm.action.SendKey { key = ' ', mods = 'CTRL', }, },
		{ key = 'n', mods = 'CTRL', action = wezterm.action.SendKey { key = 'n', mods = 'CTRL', }, },
		{ key = 'e', mods = 'CTRL', action = wezterm.action.SendKey { key = 'e', mods = 'CTRL', }, },
		{ key = 'i', mods = 'CTRL', action = wezterm.action.SendKey { key = 'i', mods = 'CTRL', }, },
		{ key = 'u', mods = 'CTRL', action = wezterm.action.SendKey { key = 'u', mods = 'CTRL', }, },
		
		{ key = ' ', mods = 'ALT', action = wezterm.action.SendKey { key = ' ', mods = 'ALT', }, },
		{ key = 'n', mods = 'ALT', action = wezterm.action.SendKey { key = 'n', mods = 'ALT', }, },
		{ key = 'e', mods = 'ALT', action = wezterm.action.SendKey { key = 'e', mods = 'ALT', }, },
		{ key = 'i', mods = 'ALT', action = wezterm.action.SendKey { key = 'i', mods = 'ALT', }, },
		{ key = 'u', mods = 'ALT', action = wezterm.action.SendKey { key = 'u', mods = 'ALT', }, },
	}--]]
}

if config.color_scheme == 'Vs Code Dark+ (Gogh)' then
	config.colors = {
		tab_bar = {
			background = '#181818',
			active_tab = {
				bg_color = '#1E1E1E',
				fg_color = '#c0c0c0',
				intensity = 'Normal',
				underline = 'None',
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = '#181818',
				fg_color = '#808080',
			},
			new_tab = {
				bg_color = '#181818',
				fg_color = '#808080',
			},
		},
	}
end

if config.color_scheme == 'Alabaster' or config.color_scheme == 'Vs Code Light+ (Gogh)' then
	config.colors = {
		tab_bar = {
			background = '#fff',
			active_tab = {
			  bg_color = '#fff',
			  fg_color = '#c0c0c0',
			  intensity = 'Normal',
			  underline = 'None',
			  italic = true,
			  strikethrough = false,
			},
			inactive_tab = {
			  bg_color = '#fff',
			  fg_color = '#808080',
			},
			inactive_tab_hover = {
			  bg_color = '#add8e6',
			  fg_color = '#909090',
			  italic = true,
			},
			new_tab = {
			  bg_color = '#fff',
			  fg_color = '#808080',
			},
			new_tab_hover = {
			  bg_color = '#add8e6',
			  fg_color = '#909090',
			  italic = true,
			},
		},
	}
end


return config
