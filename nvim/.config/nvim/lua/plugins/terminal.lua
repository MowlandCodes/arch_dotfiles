return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	opts = {
		size = 10,
		open_mapping = "<c-s>",
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
}
