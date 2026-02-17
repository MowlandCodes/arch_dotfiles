return {
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp",
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
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = false,
				["<C-n>"] = false,
				["<C-CR>"] = { "select_and_accept", "fallback" },
				["<Tab>"] = { "select_and_accept", "fallback_to_mappings" },
				["<C-e>"] = { "cancel" },
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
			snippets = { preset = "luasnip" },

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
