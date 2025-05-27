return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"jonarrien/telescope-cmdline.nvim",
		},
		keys = {
			{ ":", "<cmd>Telescope cmdline<cr>", desc = "Command Line", mode = "n" },
		},
		config = function()
			-- Using Telescope Package
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope - Find Files" })
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope - Live Greps" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope - Buffers" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					cmdline = {
						picker = {
							layout_config = {
								width = 120,
								height = 25,
							},
						},
						mappings = {
							complete = "<Tab>",
							run_selection = "<C-CR>",
							run_input = "<CR>",
						},
						overseer = {
							enabled = true,
						},
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("cmdline")
		end,
	},
}
