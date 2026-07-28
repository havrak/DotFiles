-- ==========================================
-- Variables
-- ==========================================

local mainMod  = "ALT"
local superMod = "SUPER"

-- ==========================================
-- 1. Window Manipulation
-- ==========================================

-- Focus (Alt + Arrows)
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "d" }))

-- Move Window (Alt + Shift + Arrows)
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down",  hl.dsp.window.move({ direction = "d" }))

-- Resize (Super + Arrows) -> binde equivalent using { repeating = true }
hl.bind(superMod .. " + Right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }),  { repeating = true })
hl.bind(superMod .. " + Left",  hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(superMod .. " + Up",    hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(superMod .. " + Down",  hl.dsp.window.resize({ x = 0, y = 20, relative = true }),  { repeating = true })

-- Rotation / Layout Split
hl.bind(mainMod .. " + R",         hl.dsp.layout("rotatesplit"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.layout("swapsplit"))

-- Fullscreen (Alt + F)
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ state = 0 }))

-- Toggle Floating (Alt + Shift + Space)
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))

-- Kill Window (Alt + Q - mapped to 'alt + shift + q' in your bspwmrc usually, but sxhkd says alt+q is kill?)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())

-- ==========================================
-- 2. Workspaces
-- ==========================================

local workspace_keys = {
    {"1", 1}, {"2", 2}, {"3", 3}, {"4", 4}, {"5", 5}, {"6", 6},
    {"7", 7}, {"8", 8}, {"9", 9}, {"0", 10}, {"minus", 11}, {"equal", 12}
}

for _, w in ipairs(workspace_keys) do
    local key = w[1]
    local ws  = w[2]
    -- Switch to 1-12
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = ws }))
    -- Move window to 1-12
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
end

-- ==========================================
-- 3. Utilities & Launchers
-- ==========================================

-- Dmenu / Scripts (Ensure these are executable and in PATH)
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("tofi-drun --drun-launch=true"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/bin/scripts/hyprland/hyp-screen-chooser"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/bin/scripts/wm-agnostic/clipboard-text"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("~/bin/scripts/wm-agnostic/emoji-picker"))

-- Power / Lock (Super + F1/F2/F3/F4)
-- IMPORTANT: pixel-lock is X11. Use swaylock for Wayland.
hl.bind(superMod .. " + F1", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(superMod .. " + F2", hl.dsp.exec_cmd("~/bin/scripts/wm-agnostic/power-menu -l"))
hl.bind(superMod .. " + F3", hl.dsp.exec_cmd("~/bin/scripts/wm-agnostic/power-menu -p"))
hl.bind(superMod .. " + F4", hl.dsp.exec_cmd("~/bin/scripts/tools/power-mode -a"))

-- ==========================================
-- 4. Terminal & Apps
-- ==========================================

-- Standard Terminal
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("kitty"))

-- TUI Apps
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("kitty -e neomutt"))
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("kitty -e ranger"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("kitty -e nmtui"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("kitty -e nvim"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("kitty -e htop"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("kitty -e nvim -c VimwikiIndex"))

-- GUI Apps
hl.bind(superMod .. " + F", hl.dsp.exec_cmd("start-and-notify firefox"))
hl.bind(superMod .. " + S", hl.dsp.exec_cmd("start-and-notify spotify"))
hl.bind(superMod .. " + P", hl.dsp.exec_cmd("start-and-notify pavucontrol"))
hl.bind(superMod .. " + K", hl.dsp.exec_cmd("start-and-notify keepassxc"))
hl.bind(superMod .. " + Q", hl.dsp.exec_cmd("start-and-notify qalculate-qt"))

-- ==========================================
-- 5. Scratchpads
-- ==========================================

-- Hyprland uses "Special Workspaces" for this.
-- Alt+X: Toggle 'gpt' scratchpad
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/bin/scripts/hyprland/hyp-scratchpad --toggle gpt"))

-- ==========================================
-- 6. Hardware Keys (Audio/Brightness/Print)
-- ==========================================

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),  { repeating = true })

-- Audio (PulseAudio)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),  { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Screenshots (Replaces 'scrot'. mkdir -p ~/tmp/screen first.)
hl.bind("KP_Equal",           hl.dsp.exec_cmd("grim -t jpeg -q 90 ~/tmp/screen/$(date +%s).jpg"))
hl.bind("SHIFT + KP_Equal",   hl.dsp.exec_cmd("geometry=$(slurp) && sleep 0.05 && grim -g \"$geometry\" -t jpeg -q 90 ~/tmp/screen/$(date +%s).jpg"))
hl.bind("Print",              hl.dsp.exec_cmd("grim -t jpeg -q 90 ~/tmp/screen/$(date +%s).jpg"))
hl.bind("SHIFT + Print",      hl.dsp.exec_cmd("geometry=$(slurp) && sleep 0.05 && grim -g \"$geometry\" -t jpeg -q 90 ~/tmp/screen/$(date +%s).jpg"))

-- ==========================================
-- 7. Mouse Bindings
-- ==========================================

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
