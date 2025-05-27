return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			options = {
				pair_spaces = true,
				disabled_when_touch = false,
			},
			keys = {
				["("] = { escape = false, close = true, pair = "()", disabled_filetypes = {} },
				["["] = { escape = false, close = true, pair = "[]", disabled_filetypes = {} },
				["{"] = { escape = false, close = true, pair = "{}", disabled_filetypes = {} },

				[">"] = { escape = true, close = false, pair = "<>", disabled_filetypes = {} },
				[")"] = { escape = true, close = false, pair = "()", disabled_filetypes = {} },
				["]"] = { escape = true, close = false, pair = "[]", disabled_filetypes = {} },
				["}"] = { escape = true, close = false, pair = "{}", disabled_filetypes = {} },

				['"'] = { escape = true, close = true, pair = '""', disabled_filetypes = {} },
				["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = {} },
				["`"] = { escape = true, close = true, pair = "``", disabled_filetypes = {} },
			},
		})
	end,
}
