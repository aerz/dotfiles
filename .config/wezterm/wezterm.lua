local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Linux
config.enable_wayland = true

-- Appearance
config.color_scheme = 'Tomorrow Night (Gogh)'
config.font_size = 11
config.font = wezterm.font_with_fallback({
    {
      family = 'JetBrainsMono Nerd Font Mono',
      harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
    },
    'JetBrains Mono',
    'Twemoji',
    'Symbols Nerd Font Mono'
})
config.enable_tab_bar = false
config.warn_about_missing_glyphs = true

-- Launcher
config.launch_menu = {
  {
    label = 'Bash',
    args = { '/usr/bin/bash', '-l' }
  }
}

-- Mouse events
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.Nop
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor
  }
}

-- Keybindings
config.disable_default_key_bindings = true
config.keys = {
  -- menus
  { key = 'P', mods = 'CTRL|SHIFT', action = wezterm.action.ShowLauncher },
  { key = 'Tab', mods = 'CTRL', action = wezterm.action.ShowTabNavigator },
  -- panes
  { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' })},
  { key = 'h', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection('Left') },
  { key = 'j', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection('Down') },
  { key = 'k', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection('Up') },
  { key = 'l', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection('Right') },
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane({ confirm = true }) },
  { key = 'm', mods = 'CTRL', action = wezterm.action.PaneSelect },
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({
        PaneSelect = { mode = "SwapWithActiveKeepFocus" }
    })
  },
  -- tabs
  { key = '{', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = '}', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'W', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab({ confirm = true }) },
  {
    -- rename current tab
    key = 'E',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PromptInputLine({
        description = 'Enter name for this tab',
        action = wezterm.action_callback(
          function(window, _, line)
            if line then window:active_tab():set_title(line) end
          end
        )})
  },
  { key = 'z', mods = 'CTRL', action = wezterm.action.TogglePaneZoomState }
}

return config
