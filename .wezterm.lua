local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 14

-- Disable bar
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

-- background opacity
config.window_background_opacity = 0.8
config.macos_window_background_blur = 40

-- colorscheme
config.color_scheme = 'Catppuccin Mocha'

local paddingX = '2cell'
config.window_padding = {
    left = paddingX,
    right = paddingX,
    top = '1cell',
    bottom = 0
}

return config;
