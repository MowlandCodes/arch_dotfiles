return {
	"princejoogie/chafa.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"m00qek/baleia.nvim",
	},
	config = function()
		vim.g.baleia = require("baleia").setup({})

		local chafa = require("chafa")
		chafa.setup({
			render = {
				min_padding = 5,
				show_label = true,
			},
			events = {
				update_on_nvim_resize = true,
			},
		})

		-- Command to colorize current buffer --
		vim.api.nvim_create_user_command("BaleiaColorize", function()
			vim.g.baleia.once(vim.api.nvim_get_current_buf())
		end, { bang = true })

		vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
			pattern = {
				"*.md",
				"*.html",
				"*.mdx",
			},
			callback = function()
				vim.g.baleia.automatically(vim.api.nvim_get_current_buf())
			end,
		})
	end,
}
