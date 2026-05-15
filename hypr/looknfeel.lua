-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in          = 2,
		gaps_out         = 0,

		border_size      = 1,

		col              = {
			-- active_border   = { colors = {"rgba(808080ff)", "rgba(00ff99ee)"}, angle = 45 },
			active_border   = { colors = { "rgba(808080ff)" } },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing    = false,

		layout           = "dwindle",
	},

	decoration = {
		rounding         = 10,
		rounding_power   = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity   = 1.0,
		inactive_opacity = 1.0,

		shadow           = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			color        = 0xee1a1a1a,
		},

		blur             = {
			enabled  = true,
			size     = 3,
			passes   = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	-- Layouts
	dwindle = {
		preserve_split = true, -- You probably want this
	},
	-- master
	master = {
		new_status = "master",
	},
	-- Scrolling-Layout
	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
		-- disable_autoreload      = true
	},
})
