return {
	"machakann/vim-sandwich", -- Sandwich around word
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- Dress up command popup windows
	{ "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true }, -- True color
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = true }, -- Git side info
}
