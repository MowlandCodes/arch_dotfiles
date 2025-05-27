return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				PATH = "prepend",
			})
			vim.keymap.set("n", "<leader>ms", ":Mason<CR>", { silent = true, desc = "Mason LSP Manager" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jedi_language_server",
					"clangd",
					"cssls",
					"html",
					"emmet_language_server",
					"tailwindcss",
					"bashls",
					"biome",
					"ltex",
					"pyright",
					"stimulus_ls",
					"intelephense",
					"ts_ls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			lspconfig.ast_grep.setup({
				capabilities = capabilities,
			})
			lspconfig.jedi_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--fallback-style=webkit",
				},
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				filetypes = { "html", "htmldjango", "php", "blade", "ejs" },
				capabilities = capabilities,
			})
			lspconfig.djlsp.setup({
				cmd = { "/home/mowlandcodes/.local/bin/djlsp" },
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.biome.setup({
				capabilities = capabilities,
			})
			lspconfig.ltex.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.phpactor.setup({
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"ejs",
				},
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"css",
					"php",
					"htmldjango",
					"blade",
					"ejs",
				},
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"php",
					"blade",
					"htmldjango",
				},
			})
			lspconfig.asm_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.powershell_es.setup({
				capabilities = capabilities,
				bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
				filetypes = "ps1",
			})

			-- Keymapping for Tooltip Docs
			vim.keymap.set("n", "<leader>lh", function()
				vim.lsp.buf.hover()
				vim.lsp.buf.hover()
			end, { silent = true, desc = "LSP Hover Tooltip" })
			vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { silent = true, desc = "LSP Code Action" })
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { silent = true, desc = "LSP Code Reference" })
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { silent = true, desc = "LSP Code Definition" })
		end,
	},
}
