return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- Language update
		local function spellupdate()
			return vim.opt.spell["_value"]
		end

		local function spelllang()
			local lang = vim.opt.spelllang["_value"]
			local currentlang = {
				["en_us"] = "English",
				["da"] = "Danish",
			}
			return currentlang[lang]
		end

		lualine.setup({
			options = {
				theme = "nord",
			},
			sections = {
				lualine_x = {
					{
						spelllang,
						cond = spellupdate,
						color = { fg = "#B48EAD", gui = "bold" },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#D08770" },
					},
					{ "filetype" },
				},
			},
		})
	end,
}
