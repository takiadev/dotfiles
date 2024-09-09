local wezterm = require("wezterm")
local config = {
	font = wezterm.font("Consolas NF"),
	default_prog = { "pwsh.exe", "-NoLogo" },
	color_scheme = "Tokyo Night Storm",
	hide_tab_bar_if_only_one_tab = false,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
}


return config
