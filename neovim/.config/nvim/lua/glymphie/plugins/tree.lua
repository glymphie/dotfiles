return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		-- Keymap
		vim.keymap.set("n", "<leader>s", vim.cmd.NvimTreeFocus, { desc = "Toggle File Explorer" })

		-- Custom keymaps in nvim-tree
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "s", api.tree.reload, opts("Refresh"))
		end

		-- recommended settings from nvim-tree documentation
		nvimtree.setup({
			on_attach = my_on_attach,
			diagnostics = {
				enable = true,
			},
			view = {
				preserve_window_proportions = true,
				signcolumn = "no",
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
		})
	end,
}
