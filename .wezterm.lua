-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local dimmer = { brightness = 0.008 }
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Dark Violet (base16)"
config.color_scheme = 'darkmoss (base16)'
config.font = wezterm.font('0xProto Nerd Font Mono', { weight = 'Medium' })
config.font_size = 10
config.background = { { source = { File = 'C:/Users/Kamui/Pictures/Wezterm/blue.jpg' }, hsb = dimmer } }
-- config.background = { { source = { File = "C:/Users/Kamui/Pictures/Wezterm/grey.png" }, hsb = dimmer } }
config.window_padding = {
  left = '1.0cell',
  right = '0.5cell',
  top = '0.2cell',
  bottom = '0cell',
}
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.65,
}
config.line_height = 1
-- config.enable_wayland = false
-- config.initial_cols = 200
-- config.initial_rows = 50
config.scrollback_lines = 10000
config.window_decorations = 'INTEGRATED_BUTTONS'

-- Fullscreens
local mux = wezterm.mux
wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window {
    args = { 'nvim' },
  }
  window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
