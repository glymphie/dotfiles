return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	keys = { { "<leader>mp", vim.cmd.MarkdownPreviewToggle, desc = "Preview Markdown in browser" } },
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
