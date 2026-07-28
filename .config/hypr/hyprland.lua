-- ==========================================
-- Monitor & Workspace Setup
-- ==========================================

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- ==========================================
-- Environment Variables
-- ==========================================

local cursorTheme = "Adwaita"
local cursorSize = "24"

hl.env("XCURSOR_THEME", cursorTheme)
hl.env("XCURSOR_SIZE", cursorSize)
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/amd-igpu")
hl.env("HYPRCURSOR_THEME", cursorTheme)
hl.env("HYPRCURSOR_SIZE", cursorSize)
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

-- ==========================================
-- Autostart
-- ==========================================

hl.on("hyprland.start", function()
	hl.exec_cmd("dunst")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")

	-- polkit agent is usually needed for graphical sudo prompts
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

	-- Immediately apply the theme to Hyprland
	hl.exec_cmd("hyprctl setcursor " .. cursorTheme .. " " .. cursorSize)
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")

	-- hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	-- hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	hl.exec_cmd("~/bin/scripts/hyprland/hyp-screen-chooser restore")
	hl.exec_cmd("hypridle")
end)

-- Execute on every reload
hl.exec_cmd("xrdb ~/.Xresources")

-- source = ~/.config/hypr/gpu.conf

-- ==========================================
-- Core Configuration
-- ==========================================

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,
		col = {
			active_border = "rgb(ffffd7)",
			inactive_border = "rgb(121212)",
		},
		layout = "dwindle",
	},

	input = {
		kb_layout = "us,cz",
		kb_variant = ",qwerty",

		-- Options: Caps->Esc, Win+Space to toggle layout
		kb_options = "caps:escape,grp:win_space_toggle",

		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			disable_while_typing = true,
		},
	},

	cursor = {
		no_warps = true,
	},

	decoration = {
		rounding = 4,
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
	},

	xwayland = {
		force_zero_scaling = true,
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},
})

-- ==========================================
-- Gestures
-- ==========================================

-- Translating dispatcher actions to the gesture configurations
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- ==========================================
-- Animations Setup
-- ==========================================

-- Syntax: hl.animation({ leaf = NAME, enabled = ONOFF, speed = SPEED, bezier = CURVE })
hl.curve("myBezier", { type = "bezier", points = { { 0.1, 0.1 }, { 1, 1 } } })

hl.animation({ leaf = "fade", enabled = true, speed = 0.2, bezier = "default" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 0.2, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 0.2, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "myBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })

-- ==========================================
-- Window Rules (Crucial for St/Scratchpad)
-- ==========================================

hl.window_rule({ name = "gpt-float", match = { class = "^(gpt)$" }, float = true })
hl.window_rule({ name = "gpt-center", match = { class = "^(gpt)$" }, center = true })
hl.window_rule({ name = "gpt-size", match = { class = "^(gpt)$" }, size = "800 600" })

hl.window_rule({ name = "matlab-class-float", match = { class = "^(MATLABWindow)$" }, float = true })
hl.window_rule({ name = "matlab-title-float", match = { title = "^(.*)(MATLAB)(.*)$" }, float = true })
hl.window_rule({ name = "matlab-figure-float", match = { title = "^(.*)(Figure)(.*)$" }, float = true })
hl.window_rule({ name = "matlab-class-title-float", match = { class = "^(MATLAB)$", title = "^(.*)$" }, float = true })
-- hl.window_rule({ name = "matlab-no-focus",       match = { class = "^(MATLAB)$" }, no_initial_focus = true })
-- hl.window_rule({ name = "matlab-no-shadow",      match = { class = "^(MATLAB)$" }, no_shadow = true })
-- hl.window_rule({ name = "matlab-move",           match = { class = "^(MATLAB)$", title = "^()$" }, move = "0 0" })

hl.window_rule({ name = "zathura-tile", match = { class = "^(Zathura)$" }, tile = true })
hl.window_rule({ name = "sxiv-tile", match = { class = "^(Sxiv)$" }, tile = true })
hl.window_rule({ name = "ueberzugpp-noanim", match = { class = "^(ueberzugpp.*)$" }, no_anim = true })

-- ==========================================
-- Load Bindings
-- ==========================================

require("keybindings")
