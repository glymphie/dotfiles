return {
	"gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup({
			transparent = true, -- Enable this to disable setting the background color
			borders = true, -- Enable the border between verticaly split windows visible
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme nord]])
	end,
}
