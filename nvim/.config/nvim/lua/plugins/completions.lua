return {
	"saghen/blink.cmp",
	enabled = true,
	dependencies = {
		{
			"Exafunction/codeium.nvim",
			"rafamadriz/friendly-snippets",
		},
	},

	version = "1.*",

	opts = {
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "codeium" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					score_offset = 1000,
				},
				snippets = {
					opts = {
						friendly_snippets = true,
					},
				},
				codeium = {
					name = "Codeium",
					module = "codeium.blink",
					async = true,
					score_offset = 1100,
				},
			},
		},

		keymap = {
			preset = "default",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			-- Explicit navigation map
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			list = {
				selection = {
					preselect = false,
				},
			},
		},

		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},

	opts_extend = { "sources.default" },
}
