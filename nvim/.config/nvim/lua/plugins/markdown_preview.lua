return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },

	---@module "render-markdown"
	---@type render.md.UserConfig
	opts = {
		completions = {
			lsp = {
				enabled = true,
			},
		},
		latex = {
			enabled = true,
			render_modes = false,
			converter = { "utftex", "latex2text" },
			highlight = "RenderMarkdownMath",
			position = "center",
		},
	},
}
