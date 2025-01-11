local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local action = wezterm.action

config.color_scheme = 'Builtin Tango Dark'

config.max_fps = 120

-- Font
config.font = wezterm.font("MonoLisa")
config.font_size = 15

-- Tab Bar
config.use_fancy_tab_bar = false
config.scrollback_lines = 3000
config.tab_bar_at_bottom = true
config.colors = {
    tab_bar = {
        background = '#171717',
        new_tab = {
            bg_color = '#171717',
            fg_color = '#808080'
        },
        new_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090'
        }
    }

}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

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
    return tab_info.active_pane.title:match("([^/]+)$")
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#171717'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
        background = '#2b2042'
        foreground = '#c0c0c0'
    elseif hover then
        background = '#262626'
        foreground = '#262626'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {{
        Background = {
            Color = edge_background
        }
    }, {
        Foreground = {
            Color = edge_foreground
        }
    }, {
        Text = SOLID_LEFT_ARROW
    }, {
        Background = {
            Color = background
        }
    }, {
        Foreground = {
            Color = foreground
        }
    }, {
        Text = title
    }, {
        Background = {
            Color = edge_background
        }
    }, {
        Foreground = {
            Color = edge_foreground
        }
    }, {
        Text = SOLID_RIGHT_ARROW
    }}
end)

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
