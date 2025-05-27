return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"MunifTanjim/prettier.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local prettier = require("prettier")

		local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local event = "BufWritePre"
		local async = event == "BufWritePost"

		prettier.setup({
			bin = "prettierd",
			filetypes = {
				"css",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"scss",
				"typescript",
				"typescriptreact",
				"vue",
				"yaml",
				"html",
				"markdown",
				"graphql",
			},
		})

		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<Leader>f", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format" })

					-- format on save
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
					vim.api.nvim_create_autocmd(event, {
						buffer = bufnr,
						group = group,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = async })
						end,
						desc = "[lsp] format on save",
					})
				end

				if client.supports_method("textDocument/rangeFormatting") then
					vim.keymap.set("x", "<Leader>f", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format" })
				end
			end,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.code_actions.textlint,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.prettier.with({ extra_filetypes = { "ejs" } }),
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.pretty_php,
				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.diagnostics.phpcs,
				null_ls.builtins.formatting.blade_formatter,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.pint,
			},
		})

		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Auto Formatting", silent = true })
	end,
}
