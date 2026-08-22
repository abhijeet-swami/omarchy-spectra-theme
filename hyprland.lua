-- Native Hyprland 0.55+ theme configuration.
-- Keep hyprland.conf alongside this file for older Omarchy installations.

local activeBorderColor = {
  colors = { "rgba(ffffff66)", "rgba(ffffff22)" },
  angle = 90,
}
local inactiveBorderColor = "rgba(3a3a3a60)"
local groupBorderActive = {
  colors = { "rgba(ffffff55)", "rgba(ffffff22)" },
  angle = 90,
}

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,
    col = {
      active_border = activeBorderColor,
      inactive_border = inactiveBorderColor,
    },
    resize_on_border = true,
    extend_border_grab_area = 15,
    allow_tearing = false,
    layout = "dwindle",
  },

  group = {
    col = {
      border_active = groupBorderActive,
      border_inactive = "rgba(3a3a3a55)",
      border_locked_active = {
        colors = { "rgba(ff990088)", "rgba(ff990022)" },
        angle = 90,
      },
      border_locked_inactive = "rgba(3a3a3a77)",
    },
    groupbar = {
      enabled = true,
      font_size = 10,
      gaps_in = 3,
      gaps_out = 3,
    },
  },

  animations = {
    enabled = true,
  },

  decoration = {
    rounding = 0,
    shadow = {
      enabled = true,
      range = 25,
      render_power = 3,
      color = "rgba(00000055)",
      color_inactive = "rgba(00000044)",
      offset = "0 5",
      scale = 1.0,
    },
    blur = {
      enabled = true,
      size = 4,
      passes = 3,
      contrast = 1.0,
      brightness = 0.9,
      vibrancy = 0.1,
      noise = 0.01,
      ignore_opacity = false,
      new_optimizations = true,
    },
    active_opacity = 1.0,
    inactive_opacity = 0.95,
    fullscreen_opacity = 1.0,
  },

  misc = {
    background_color = "rgba(00000000)",
  },
})

hl.curve("water", { type = "bezier", points = { { 0.22, 0.9 }, { 0.36, 1.0 } } })
hl.curve("flow", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1.0 } } })
hl.curve("ripple", { type = "bezier", points = { { 0.33, 0.0 }, { 0.2, 1.0 } } })
hl.curve("stream", { type = "bezier", points = { { 0.4, 0.0 }, { 0.4, 1.0 } } })
hl.curve("cascade", { type = "bezier", points = { { 0.19, 1.0 }, { 0.22, 1.0 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3.0, bezier = "water" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.8, bezier = "cascade" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.4, bezier = "stream" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.6, bezier = "flow" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.4, bezier = "water" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.0, bezier = "cascade" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.8, bezier = "ripple" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 2.0, bezier = "water" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 1.4, bezier = "flow" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1.5, bezier = "overshot", style = "popin 80%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.3, bezier = "md3_accel", style = "popin 90%" })
hl.animation({ leaf = "layers", enabled = true, speed = 1.5, bezier = "md3_standard" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.8, bezier = "flow" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.5, bezier = "water" })
hl.animation({ leaf = "border", enabled = true, speed = 2.9, bezier = "water" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 3.5, bezier = "flow" })

-- Layer-shell surfaces need an explicit rule; enabling global blur alone does
-- not blur launchers, notifications, the OSD, or the bar.
hl.layer_rule({
  name = "blur_with_ignore_alpha",
  match = {
    namespace = "^(omarchy-(bar|menu|notifications|osd)|walker|notifications|swayosd|waybar)$",
  },
  blur = true,
  ignore_alpha = 0.1,
})
