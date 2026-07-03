return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = {
				source = true,
				format = function(diagnostic)
					if diagnostic.user_data and diagnostic.user_data.code then
						return string.format("%s %s", diagnostic.user_data.code, diagnostic.message)
					else
						return diagnostic.message
					end
				end,
			},
			signs = true,
			float = {
				header = "Diagnostics",
				source = true,
				border = "rounded",
			},
		})
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "<leader>[", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "<leader>]", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure emmet language server
		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure bash server
		vim.lsp.config("bashls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure rust-analyzer
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure gopls
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
		})

		-- configure ruff server
		vim.lsp.config("ruff", {
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				settings = {
					lint = {
						-- Pycodestyle Error (E)
						-- Pycodestyle Warning (W)
						-- Pyflakes (F)
						-- Pydocstyle (D)
						-- Ruff-specific rules (RUF)
						select = { "E", "W", "F", "D", "RUF" },
					},
				},
			},
		})

		-- enable lsp servers
		vim.lsp.enable({
			"html",
			"cssls",
			"emmet_ls",
			"bashls",
			"lua_ls",
			"ruff",
			"rust_analyzer",
			"gopls",
		})
	end,
}
