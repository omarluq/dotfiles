-- pull the wezerm api
local wezterm = require("wezterm")
-- config holder
local config = wezterm.config_builder()
-- apply local config
config.color_scheme = "tokyonight"

-- remove title bar
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}

config.colors = {
	tab_bar = {
		background = "rgba(0,0,0,0)",
	},
}

config.text_background_opacity = 0.5

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.scrollback_lines = 200000

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#3b3052"
	local background = "#3b3052"
	local foreground = "#909090"
	if tab.is_active then
		background = "#3c1361"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end
	local edge_foreground = background
	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- file must return config table
return config
