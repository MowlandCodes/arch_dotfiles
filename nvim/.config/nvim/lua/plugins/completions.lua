return {
	{
		"L3MON4D3/LuaSnip",
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"Exafunction/codeium.nvim",
				"rafamadriz/friendly-snippets",
			},
		},

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "accept", "fallback" },
				["<C-e>"] = { "cancel", "fallback" },
				["<C-x>"] = { "show" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = { documentation = { auto_show = true } },

			sources = {
				providers = {
					codeium = { name = "Codeium", module = "codeium.blink", async = true },
				},
				default = { "lsp", "path", "snippets", "buffer", "codeium" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
