hl.window_rule({
	-- Ignore maximize requests from all apps
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Float certain windows
hl.window_rule({
	name = "float-nmtui",
	match = {
		class = "window.rule.float-nmtui",
	},
	float = true,
	size = {
		700,
		790,
	},
	move = {
		"cursor_x-700",
		"cursor_y+30",
	},
})

hl.window_rule({
	name = "float-pulsemixer",
	match = {
		class = "window.rule.float-pulsemixer",
	},
	float = true,
	size = {
		1000,
		600,
	},
	move = {
		"cursor_x-1000",
		"cursor_y+30",
	},
})

hl.window_rule({
	name = "float-rmpc",
	match = {
		class = "window.rule.float-rmpc",
	},
	float = true,
	size = {
		1000,
		805,
	},
	move = {
		"cursor_x",
		"cursor_y+30",
	},
})

hl.window_rule({
	name = "float-weather",
	match = {
		class = "window.rule.float-weather",
	},
	float = true,
	size = {
		1400,
		840,
	},
	move = {
		"cursor_x-1400",
		"cursor_y+30",
	},
})

-- Maximize some webapps
hl.window_rule({
	name = "maximize-brave-apps",
	match = {
		class = "(brave-calendar.proton.*|brave-teams.microsoft.*)",
	},
	maximize = true,
})
