local wezterm = require 'wezterm'

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox dark, medium (base16)'
  else
    return 'Gruvbox light, medium (base16)'
  end
end

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
}
