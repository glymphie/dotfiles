return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = { "▎", "▎" },
				diagnostics = "nvim_lsp",
				buffer_close_icon = "",
				hover = {
					enabled = false,
				},
				indicator = {
					icon = "",
					style = "none",
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = "▋",
					},
				},
			},
		})
	end,
}
