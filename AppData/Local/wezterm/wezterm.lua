local wezterm = require("wezterm")

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


local config = {
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
	}
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
