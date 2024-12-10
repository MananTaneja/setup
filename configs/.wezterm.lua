local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local action = wezterm.action

config.color_scheme = 'Builtin Tango Dark'

config.max_fps = 120

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

-- Tab Bar
config.use_fancy_tab_bar = false
config.scrollback_lines = 3000
config.tab_bar_at_bottom = true

-- Window
config.window_decorations = "RESIZE"

-- Key Bindings - Natural Text Editing
config.keys = {
	{ mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
}

-- Key Bindings - Custom shortcuts
config.keys = {
	{ mods = "CTRL", key = "d", action = action.SendString 'cd "$(find ~/Developer -type d -maxdepth 1 | fzf)"\r'}
}

config.audible_bell = 'Disabled'

return config
