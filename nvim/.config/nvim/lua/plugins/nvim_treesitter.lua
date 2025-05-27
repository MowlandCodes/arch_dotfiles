return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		local configs = require("nvim-treesitter.configs")

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		configs.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = {
				enable = true,
				-- disable = { "lua" }, -- Only for Neovim version under 0.10.x
			},
		})
	end,
}
