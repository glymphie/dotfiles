return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local telescope = require("telescope")

		telescope.load_extension("harpoon")

		keymap.set("n", "<leader>wa", mark.add_file, { desc = "Mark/add file with harpoon" })
		keymap.set("n", "<leader>wb", ui.toggle_quick_menu, { desc = "Show basic harpoon menu" })
		keymap.set("n", "<leader>wt", "<cmd>Telescope harpoon marks<CR>", { desc = "Show harpoon menu with Telescope" })
		keymap.set("n", "<leader>wn", ui.nav_next, { desc = "Next harpoon file" })
		keymap.set("n", "<leader>wp", ui.nav_prev, { desc = "Prev harpoon file" })
		keymap.set("n", "<leader>w1", function()
			ui.nav_file(1)
		end, { desc = "Go to harpoon file 1" })
		keymap.set("n", "<leader>w2", function()
			ui.nav_file(2)
		end, { desc = "Go to harpoon file 2" })
		keymap.set("n", "<leader>w3", function()
			ui.nav_file(3)
		end, { desc = "Go to harpoon file 3" })
		keymap.set("n", "<leader>w4", function()
			ui.nav_file(4)
		end, { desc = "Go to harpoon file 4" })
		keymap.set("n", "<leader>w5", function()
			ui.nav_file(5)
		end, { desc = "Go to harpoon file 5" })
	end,
}
