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
			"saghen/blink.cmp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},

		config = function()
			local servers = {
				lua_ls = {
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
				},
				ast_grep = {},
				clangd = {},
				jq_lsp = {},
				cssls = {},
				html = {},
				bashls = {},
				biome = {},
				ltex = {},
				pyright = {},
				phpactor = {},
				intelephense = {},
				ts_ls = {
					filetypes = {
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
					},
				},
				emmet_language_server = {
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
				},
				tailwindcss = {
					filetypes = {
						"html",
						"php",
						"blade",
						"htmldjango",
					},
				},
				powershell_es = {
					bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
					filetypes = "ps1",
				},
				nim_langserver = {
					settings = {
						nim = {
							nimsuggestPath = "~/.nimble/bin/nimsuggest",
						},
					},
				},
				astro = {},
				prismals = {
					cmd = { "prisma-language-server", "--stdio" },
					filetypes = {
						"prisma",
					},
				},
				cmake = {},
				wasm_language_tools = {},
			}

			local blink = require("blink.cmp")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())

			for server, config in pairs(servers) do
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

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
