-- border colors
hl.window_rule({ match = { title = ".*(?i)Hyprland.*" }, border_color = "rgb(FFFF00)" })
hl.window_rule({ match = { title = ".*nvim.*" }, border_color = "rgb(007C00)" })
hl.window_rule({ match = { title = ".*mattermost.*" }, border_color = "rgb(FFBC1F)" })
hl.window_rule({ match = { title = ".*(?i)Google.*" }, border_color = "rgb(4285F4)" })
hl.window_rule({ match = { title = ".*(?i)sign|login.*" }, border_color = "rgb(A6FF98)" })
hl.window_rule({ match = { title = ".*mpv.*" }, border_color = "rgb(36123D)" })
hl.window_rule({ match = { title = ".*KeePassXC.*" }, border_color = "rgb(FF0800)", no_screen_share = true, border_size = 7 })

-- workspaces
hl.window_rule({ match = { class = "zen" }, workspace = 1 })
hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, workspace = 2 })
hl.window_rule({ match = { class = "org.kde.krdc" }, workspace = 4 })
hl.window_rule({ match = { class = "eu.betterbird.Betterbird" }, workspace = 6 })
hl.window_rule({ match = { class = "google-chrome" }, workspace = 7 })
hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = 9 })

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name           = "suppress-maximize-events",
	match          = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name     = "fix-xwayland-drags",
	match    = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name  = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move  = "20 monitor_h-120",
	float = true,
})
