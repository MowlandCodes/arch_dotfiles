return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				enable_chat = true,
				workspace_root = {
					use_lsp = true,
					find_root = function()
						return vim.fn.getcwd()
					end,
				},
			})

			-- Spawning Codeium Chat in Browser (using formatted string)
			vim.keymap.set("n", "<Leader>aa", ":Codeium Chat<CR>", { silent = true, desc = "Codeium Chat" })
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local codecompanion = require("codecompanion")

			codecompanion.setup({
                codellama = function ()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "codellama",
                        schema = {
                            model = {
                                default = "codellama:latest",
                            },
                            num_ctx = {
                                default = 24000,
                            },
                            num_predict = {
                                default = -1
                            }
                        }
                    })
                end,
				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
				},
			})
			-- Added Keymaps
			vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "Code Companion Actions" })
			vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "Code Companion Actions" })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ac",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true, desc = "Toggle Code Companion Chat" }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>ac",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true, desc = "Toggle Code Companion Chat" }
			)
			vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true, desc = "Add Code Companion" })
		end,
	},
}
