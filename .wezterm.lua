local wezterm = require 'wezterm';

local config = {
	default_prog = { 'bash' },
	color_scheme = 'One Dark (Gogh)',
	-- window_decorations = "NONE",
	hide_tab_bar_if_only_one_tab = true,
	font_size = 12,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	window_background_opacity = 1,
	-- foreground_text_hsb = {
	-- 	hue = 1,
	-- 	saturation = 1,
	-- 	brightness = 1,
	-- },
	audible_bell = "Disabled"
};

config.keys = {
	{
		key = 'v',
		mods = 'CTRL',
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	config.default_prog = { 'C:/Program Files/Git/bin/bash.exe -i -l' }
end

config.colors = { foreground = "#abb2bf", background = "#080808" }
-- config.font = wezterm.font('Hurmit Nerd Font Mono', { weight = 'Medium', italic = false })
config.font = wezterm.font('Berkeley Mono', { weight = 'Medium', italic = false })

-- wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
-- 	local xx = pane.current_working_dir
-- 	local str = string.sub(tostring(xx), 9)
-- 	return tostring(str)
-- end)

return config;
