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
}
