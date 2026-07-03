-- Apps
hl.bind(MAINMOD .. " + T", hl.dsp.exec_cmd(TERMINAL))
hl.bind(MAINMOD .. " + W", hl.dsp.exec_cmd(BROWSER))
hl.bind(MAINMOD .. " + V", hl.dsp.exec_cmd(PULSEMIXER))
hl.bind(MAINMOD .. " + S", hl.dsp.exec_cmd(RUNNER))
hl.bind(SECONDMOD .. " + S", hl.dsp.exec_cmd(LAUNCHER))

-- Quits
hl.bind(MAINMOD .. " + Q", hl.dsp.window.close())
hl.bind(THIRDMOD .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(
	SECONDMOD .. " + ESCAPE",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(SECONDMOD .. " + F8", hl.dsp.exec_raw("hyprshutdown --post-cmd 'loginctl reboot'"))
hl.bind(SECONDMOD .. " + F12", hl.dsp.exec_cmd("hyprshutdown --post-cmd 'loginctl poweroff'"))

-- Window options
hl.bind(SECONDMOD .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(SECONDMOD .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- dwindle, master, scrolling layout
local function update_waybar_hypr_layout()
	hl.exec_cmd("pkill -RTMIN+1 waybar")
end

local function set_layout(layout)
	local workspace = hl.get_active_workspace()

	if not workspace then
		return
	end

	hl.workspace_rule({
		workspace = workspace.name,
		layout = layout,
	})

	update_waybar_hypr_layout()
end

hl.bind(THIRDMOD .. " + D", function()
	set_layout("dwindle")
end)

hl.bind(THIRDMOD .. " + M", function()
	set_layout("master")
end)

hl.bind(THIRDMOD .. " + S", function()
	set_layout("scrolling")
end)

hl.on("workspace.active", function()
	update_waybar_hypr_layout()
end)

-- Move focus
hl.bind(MAINMOD .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MAINMOD .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MAINMOD .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(MAINMOD .. " + K", hl.dsp.focus({ direction = "up" }))

-- Move to Monitor
hl.bind(MAINMOD .. " + COMMA", hl.dsp.focus({ monitor = "l" }))
hl.bind(MAINMOD .. " + PERIOD", hl.dsp.focus({ monitor = "r" }))

-- Move window
hl.bind(SECONDMOD .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(SECONDMOD .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(SECONDMOD .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(SECONDMOD .. " + J", hl.dsp.window.move({ direction = "down" }))

-- Move window to monitor
hl.bind(SECONDMOD .. " + COMMA", hl.dsp.window.move({ monitor = "-1" }))
hl.bind(SECONDMOD .. " + PERIOD", hl.dsp.window.move({ monitor = "+1" }))

-- Resize window
hl.bind(SECONDMOD .. " + I", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(SECONDMOD .. " + U", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, SMW.get_amount_of_workspaces() do
	local key = tostring(i)
	local workspace = tostring(i)

	if i == 10 then
		key = "0"
	end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
	-- Switch to the Nth workspace on the currently focused monitor.
	hl.bind(MAINMOD .. " +" .. key, SMW.workspace(workspace))

	-- Move the active window to the Nth workspace on the currently focused monitor.
	hl.bind(SECONDMOD .. " +" .. key, SMW.move_to_workspace(workspace))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(MAINMOD .. " + mouse_down", SMW.cycle_workspaces("next"))
hl.bind(MAINMOD .. " + mouse_up", SMW.cycle_workspaces("prev"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(MAINMOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAINMOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Music
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("rmpc next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("rmpc prev"))
hl.bind(MAINMOD .. " + P", function()
	hl.exec_cmd("rmpc togglepause")
	hl.exec_cmd("pkill -RTMIN+2 waybar")
end)
hl.bind(THIRDMOD .. " + COMMA", hl.dsp.exec_cmd("pulsemixer --change-volume -5 --max-volume 100"), { repeating = true })
hl.bind(
	THIRDMOD .. " + PERIOD",
	hl.dsp.exec_cmd("pulsemixer --change-volume +5 --max-volume 100"),
	{ repeating = true }
)
hl.bind(FOURTHMOD .. " + COMMA", hl.dsp.exec_cmd("rmpc prev"))
hl.bind(FOURTHMOD .. " + PERIOD", hl.dsp.exec_cmd("rmpc next"))

-- Language Switcher
hl.bind(MAINMOD .. " + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
