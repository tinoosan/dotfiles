local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {

  enable_wayland = false,
  automatically_reload_config = true,
  font = wezterm.font("JetBrainsMonoNL Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Normal"}),
  font_size = 16,  -- Adjust the font size as needed
  color_scheme = "Catppuccin Mocha",
  -- enable_tab_bar = true,  -- Enable the tab bar
  hide_tab_bar_if_only_one_tab = true,  -- Hide the tab bar if there's only one tab
  -- tab_bar_at_bottom = false,  -- Set this to true if you want the tab bar at the bottom
  -- use_fancy_tab_bar = true,  -- Enable fancy tab bar for rounded corners and better styling
  -- tab_max_width = 30,  -- Set the maximum width for tabs

  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE", -- Disable the title bar but enable the resizable border
  default_cursor_style = "SteadyBlock",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  colors = {
    tab_bar = {
      background = "#1e1e2e",  -- Background color for the tab bar

      active_tab = {
        bg_color = "#89b4fa",  -- Background color for the active tab
        fg_color = "#1e1e2e",  -- Text color for the active tab
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#1e1e2e",  -- Background color for inactive tabs
        fg_color = "#cdd6f4",  -- Text color for inactive tabs
      },

      inactive_tab_hover = {
        bg_color = "#45475a",  -- Background color for hovered inactive tabs
        fg_color = "#cdd6f4",  -- Text color for hovered inactive tabs
        italic = true,
      },

      new_tab = {
        bg_color = "#1e1e2e",  -- Background color for the new tab button
        fg_color = "#cdd6f4",  -- Text color for the new tab button
      },

      new_tab_hover = {
        bg_color = "#45475a",  -- Background color for the new tab button when hovered
        fg_color = "#cdd6f4",  -- Text color for the new tab button when hovered
        italic = true,
      },
    },
  },

  -- Font smoothing setting
  --freetype_load_target = "Mono",
  --freetype_render_target = "HorizontalLcd",
  cell_width = 0.9,

  -- Add keybindings for Option + 3 to produce #
  keys = {
    { key = "3", mods = "ALT", action = wezterm.action{ SendString = "#" } },
  },

  -- Optional: Allow Alt to act as a normal modifier for composing characters
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = true,
}

return config
