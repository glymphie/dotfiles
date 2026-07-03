return {
	"lambdalisue/suda.vim",
	init = function()
		vim.g.suda_smart_edit = 1
		vim.g["suda#nopass"] = 1
		vim.g["suda#executable"] = "doas"
	end,
}
