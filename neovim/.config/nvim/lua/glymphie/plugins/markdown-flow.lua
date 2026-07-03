return {
	"jakewvincent/mkdnflow.nvim",
	ft = { "markdown" },
	config = function()
		require("mkdnflow").setup({
			to_do = {
				highlight = false,
				statuses = {
					not_started = { marker = " " },
					in_progress = { marker = "-" },
					complete = { marker = "x" },
				},
				status_order = { "not_started", "in_progress", "complete" },
			},
			mappings = {
				MkdnEnter = { { "i", "v", "n" }, "<CR>" },
			},
		})
	end,
}
