return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = true,
			virtual_text = {
				enabled = true,
			},
			workspace_root = {
				use_lsp = true,
				find_root = function()
					vim.fn.getcwd()
				end,
			},
		})
	end,
}
