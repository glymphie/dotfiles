return {
	"NeogitOrg/neogit",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		local keymap = vim.keymap
		neogit.setup({
			disable_context_highlighting = true,
		})

		keymap.set("n", "<leader>gs", function()
			neogit.open({ kind = "auto" })
		end, { desc = "Git Status split" })
		keymap.set("n", "<leader>gS", function()
			neogit.open({ kind = "replace" })
		end, { desc = "Git Status replace" })
	end,
}
