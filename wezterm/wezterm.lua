local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.color_scheme = "Dracula"
config.colors = {
    foreground = "#c0c0c0",
    background = "#1c1c1c",
    cursor_bg = "#ffffff",
    cursor_border = "#ffffff",
    cursor_fg = "#000000",
    selection_bg = "#444444",
    selection_fg = "#ffffff",
    -- Define ANSI colors
    ansi = {
        "#000000", -- Color 0: Black
        "#ff5555", -- Color 1: Red
        "#50fa7b", -- Color 2: Green
        "#f1fa8c", -- Color 3: Yellow
        "#bd93f9", -- Color 4: Blue
        "#ff79c6", -- Color 5: Magenta
        "#8be9fd", -- Color 6: Cyan
        "#bbbbbb", -- Color 7: White
    },
    brights = {
        "#44475a", -- Color 8: Bright Black (Gray)
        "#ff6e6e", -- Color 9: Bright Red
        "#69ff94", -- Color 10: Bright Green
        "#ffffa5", -- Color 11: Bright Yellow
        "#d6acff", -- Color 12: Bright Blue
        "#ff92df", -- Color 13: Bright Magenta
        "#a4ffff", -- Color 14: Bright Cyan
        "#ffffff", -- Color 15: Bright White
    },
}

return config