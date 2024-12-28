local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local action = wezterm.action

config.color_scheme = 'Builtin Tango Dark'

config.max_fps = 120

-- Font
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 15

-- Tab Bar
config.use_fancy_tab_bar = false
config.scrollback_lines = 3000
config.tab_bar_at_bottom = true

-- Window
config.window_decorations = "RESIZE"
config.initial_rows = 48
config.initial_cols = 150

-- Key Bindings
config.keys = { -- Natural Text Editing
{
    mods = "OPT",
    key = "LeftArrow",
    action = action.SendKey({
        mods = "ALT",
        key = "b"
    })
}, {
    mods = "OPT",
    key = "RightArrow",
    action = action.SendKey({
        mods = "ALT",
        key = "f"
    })
}, {
    mods = "CMD",
    key = "LeftArrow",
    action = action.SendKey({
        mods = "CTRL",
        key = "a"
    })
}, {
    mods = "CMD",
    key = "RightArrow",
    action = action.SendKey({
        mods = "CTRL",
        key = "e"
    })
}, {
    mods = "CMD",
    key = "Backspace",
    action = action.SendKey({
        mods = "CTRL",
        key = "u"
    })
}, -- Custom Shortcuts
{
    mods = "CTRL",
    key = "d",
    action = action.SendString 'cd "$(find ~/Developer -type d -maxdepth 1 | fzf)"\r'
}, -- Split Panes
{
    key = 'd',
    mods = "CMD",
    action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'h',
    mods = "CMD",
    action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'w',
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
}, {
    key = 'LeftArrow',
    mods = 'CMD',
    action = action.ActivatePaneDirection 'Left'
}, {
    key = 'RightArrow',
    mods = 'CMD',
    action = action.ActivatePaneDirection 'Right'
}, {
    key = 'UpArrow',
    mods = 'CMD',
    action = action.ActivatePaneDirection 'Up'
}, {
    key = 'DownArrow',
    mods = 'CMD',
    action = action.ActivatePaneDirection 'Down'
}, -- Clear Scrollback and Search
{
    mods = "CMD",
    key = "k",
    action = action.ClearScrollback 'ScrollbackAndViewport'
}, {
    mods = "CMD",
    key = 'f',
    action = action.Search {
        CaseInSensitiveString = ''
    }
}}

config.audible_bell = 'Disabled'

return config
