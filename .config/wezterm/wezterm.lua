local wezterm = require 'wezterm';

return {
  color_scheme = "Tomorrow Night (Gogh)",
  enable_wayland = true,
  font = wezterm.font_with_fallback({
      {family="JetBrainsMono Nerd Font Mono", harfbuzz_features={"calt=1", "clig=1", "liga=1"}},
      "JetBrains Mono",
      "Twemoji",
      "Symbols Nerd Font Mono"
  }),
  font_size = 11,
  enable_tab_bar = false,
  warn_about_missing_glyphs = true
}
