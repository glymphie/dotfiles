-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
--
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("setbackground > /tmp/paper.log 2>&1")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
	hl.exec_cmd("mpd")
	hl.exec_cmd("/usr/libexec/hyprpolkitagent")
end)
