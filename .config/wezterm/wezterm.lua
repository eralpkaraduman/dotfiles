local wezterm = require 'wezterm'

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox dark, medium (base16)'
  else
    return 'Gruvbox light, medium (base16)'
  end
end

wezterm.on("window-resized", function(window, pane)
  local window_dims = window:get_dimensions();
  local overrides = window:get_config_overrides() or {}
  local new_padding = {
    left = math.floor((window_dims.pixel_width % 19) / 2),
    right = 0,
    -- top = math.floor((window_dims.pixel_height % 43) / 2),
    top = 0,
    bottom = 0
  };
  overrides.window_padding = new_padding
  window:set_config_overrides(overrides)
end);

return {
    color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
    font = wezterm.font 'Liga SFMono Nerd Font',
    font_size = 15,
    enable_tab_bar = false,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    -- window_decorations = "RESIZE"
}
