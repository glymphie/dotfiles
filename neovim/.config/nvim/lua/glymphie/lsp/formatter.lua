return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local keymap = vim.keymap

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				javascript = { "prettier" },
				markdown = { "prettier" },
				typescript = { "prettier" },
				yaml = { "prettier" },
				["*"] = { "trim_whitespace" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
			format_after_save = {
				lsp_format = "fallback",
				async = true,
			},
		})

		keymap.set({ "n", "v" }, "<leader>F", function()
			conform.format({
				lsp_fallback = true,
				async = true,
			})
		end, { desc = "Format" })
	end,
}
