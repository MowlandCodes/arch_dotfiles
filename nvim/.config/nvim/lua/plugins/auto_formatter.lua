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
				php = { "pint", "pretty_php" },
				html = { "prettier", "prettierd", stop_after_first = true },
				javascript = { "prettier", "prettierd", stop_after_first = true },
				javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				typescript = { "prettier", "prettierd", stop_after_first = true },
				typescriptreact = { "prettier", "prettierd", stop_after_first = true },
				json = { "prettier", "prettierd", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 300,
				lsp_format = "callback",
			},
		})
	end,
}
