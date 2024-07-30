local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE", -- disable the title bar but enable the resizable border
	default_cursor_style = "BlinkingBar",
	color_scheme = "Tokyo Night",
	font_size = 12.5,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
}

return config
