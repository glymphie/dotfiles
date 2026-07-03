return {
	"numToStr/Comment.nvim", -- Commenting
	config = function()
		local comment = require("Comment")
		comment.setup({
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = false,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = false,
			},
		})

		-- keymaps
		local api = require("Comment.api")
		local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
		local keymap = vim.keymap

		keymap.set("n", "<leader>cc", api.toggle.linewise.current, { desc = "Comment linewise" })
		-- keymap.set("n", "<leader>cb", api.toggle.blockwise.current, { desc = "Comment blockwise" })
		vim.keymap.set(
			"n",
			"<leader>cb",
			api.call("toggle.linewise", "g@"),
			{ expr = true, desc = "Comment linewise [motion]" }
		)

		-- Toggle selection (linewise)
		keymap.set("x", "<leader>cc", function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			api.toggle.linewise(vim.fn.visualmode())
		end, { desc = "Comment linewise (visual)" })

		-- Toggle selection (blockwise)
		keymap.set("x", "<leader>cb", function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			api.toggle.blockwise(vim.fn.visualmode())
		end, { desc = "Comment blockwise (visual)" })
	end,
}
