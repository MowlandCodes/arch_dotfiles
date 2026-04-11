return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				php = { "pretty_php" },
				html = {},
				javascript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				json = { "prettier", stop_after_first = true },
				markdown = { "markdownlint-cli2", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 300,
				lsp_format = "callback",
			},
		})
	end,
}
