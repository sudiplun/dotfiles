-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

for i = 1, 5 do
	local key = i % 10 -- 10 maps to key 0
	-- on uk keyboard MOD5 = alt gr on the right side 
	hl.bind("MOD5 + " .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("MOD5 + " .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- 
hl.bind("CTRL + M", hl.dsp.exec_cmd("pamixer --default-source -m"))
hl.bind("CTRL + SHIFT + M", hl.dsp.exec_cmd("pamixer --default-source -u"))
