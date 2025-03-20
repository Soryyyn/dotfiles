local wezterm = require('wezterm')

-- detect os
local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_windows <const> = wezterm.target_triple:find("windows") ~= nil

local config = wezterm.config_builder()

-- macos specific config
if is_darwin then
    config.font_size = 14

    config.window_background_opacity = 0.8
end

-- windows specific config
if is_windows then
    config.wsl_domains = {
        {
            name = 'WSL:Ubuntu',
            distribution = 'Ubuntu',
        },
    }
    config.default_domain = 'WSL:Ubuntu'

    config.font_size = 12

    config.window_background_opacity = 0.9
end

config.font = wezterm.font('JetBrainsMono Nerd Font Mono')

-- disable bar
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

-- background opacity
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
