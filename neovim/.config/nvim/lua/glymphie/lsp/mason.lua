return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-tool-istaller
		local mason_tool_installer = require("mason-tool-installer")

		-- Keymap to open Mason
		vim.keymap.set("n", "<leader>M", vim.cmd.Mason, { desc = "Open Mason" })

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓ ",
					package_pending = "➜ ",
					package_uninstalled = "✗ ",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				{ "html" },
				{ "cssls" },
				{ "bashls" },
				{ "ruff" },
				{ "lua_ls" },
				{ "emmet_ls" },
				{ "prettier" },
				{ "stylua" },
			},
			auto_update = true,
		})
	end,
}
