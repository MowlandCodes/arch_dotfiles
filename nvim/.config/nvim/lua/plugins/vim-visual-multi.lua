return {
	"mg979/vim-visual-multi",
	config = function()
		vim.g.VM_default_mappings = 0
		vim.g.VM_add_cursor_at_pos_no_mappings = 1

		local wk = require("which-key")

		-- local function visual_cursors_with_delay()
		--     vim.cmd('silent! execute "normal! <Plug>(VM-Visual-Cursors)"')
		--     vim.cmd("sleep 200m")
		--     vim.cmd("silent! execute 'normal! A'")
		-- end
 
		wk.add({
			-- m = {
			--     name = "Visual Multi",
			--     a = { "<Plug>(VM-Select-All)", "Visual Multi - Select All", mode = { "n" } },
			--     p = { "<Plug>(VM-Add-Cursor-At-Pos)", "Visual Multi - Add Cursor at Position", mode = { "n" } },
			--     o = { "<Plug>(VM-Toggle-Mappings)", "Visual Multi - Toggle Mappings", mode = { "n" } },
			--     v = { visual_cursors_with_delay, "Visual Multi - Visual Cursors", mode = { "v" } },
			--     n = { "<Plug>(VM-Find-Under)", "Visual Multi - Start Multi Cursors", mode = { "n" } },
			-- },
			{ "<leader>m", group = "Visual Multi" },
			{ "<leader>ma", "<Plug>(VM-Select-All)", desc = "Visual Multi - Select All", mode = { "n" } },
			{ "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "Visual Multi - Add Cursor At Pos", mode = { "n" } },
			{ "<leader>mv", "<Plug>(VM-Toggle-Mappings)", desc = "Visual Multi - Toggle Mappings", mode = { "n" } },
			{
				"<leader>mn",
				"<Plug>(VM-Find-Under)",
				desc = "Visual Multi - Start Multiple Cursors",
				mode = { "n", "v" },
			},
		})
	end,
}
