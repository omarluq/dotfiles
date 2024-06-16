-- pull the wezerm api
local wezterm = require("wezterm")
-- config holder
local config = wezterm.config_builder()
-- apply local config
config.color_scheme = "nord"
config.force_reverse_video_cursor = true
-- -- remove title bar
-- In wayland this is not enough, extra config is needed to completely remove the bar
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
--
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
--
config.colors = {
	tab_bar = {
		background = "rgba(0,0,0,0)",
	},
}
--
-- config.text_background_opacity = 0.40
config.window_background_opacity = 0.96

config.scrollback_lines = 200000

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
config.font_size = 9.20

config.enable_wayland = true

-- file must return config table
return config
