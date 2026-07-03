package.path = package.path .. ";./?.lua;./?/init.lua"
SMW = require("conf.plugins.split-monitor-workspaces")

SMW.setup({
	workspace_count = 10,
	enable_persistent_workspaces = false,
})
