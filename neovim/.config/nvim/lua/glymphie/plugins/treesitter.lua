return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			ts.install({
				"json",
				"javascript",
				"typescript",
				"tsx",
				"latex",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"python",
				"vim",
				"dockerfile",
				"gitignore",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"json",
					"javascript",
					"typescript",
					"typescriptreact",
					"javascriptreact",
					"tex",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"graphql",
					"sh",
					"lua",
					"python",
					"vim",
					"dockerfile",
					"gitignore",
				},

				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
