return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"gbprod/none-ls-ecs.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local event = "BufWritePre"

		null_ls.setup({
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<Leader>lf", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format" })

					-- format on save
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = augroup })
					vim.api.nvim_create_autocmd(event, {
						buffer = bufnr,
						group = augroup,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								filter = function(c)
									return c.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
						desc = "[lsp] format on save",
					})
				end

				if client:supports_method("textDocument/rangeFormatting") then
					vim.keymap.set("x", "<Leader>f", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format range" })
				end
			end,

			sources = {
				require("none-ls-ecs.formatting"),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.code_actions.textlint,
				null_ls.builtins.formatting.markdownlint,

				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = {
						"astro",
						"blade",
						"html",
						"php",
						"vue",
						"javascript",
						"typescript",
						"json",
						"bson",
						"jsonc",
						"typescriptreact",
						"javascriptreact",
					},
				}),

				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.pretty_php,
				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.diagnostics.phpcs,
				null_ls.builtins.formatting.blade_formatter,
				null_ls.builtins.formatting.pint,
				null_ls.builtins.formatting.nimpretty,
			},
		})
	end,
}
