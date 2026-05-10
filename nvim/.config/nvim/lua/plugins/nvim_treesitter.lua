return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.config")

		configs.setup({
			ensure_installed = {
				"astro",
				"bash",
				"blade",
				"c",
				"cpp",
				"comment",
				"css",
				"diff",
				"dockerfile",
				"fish",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"html",
				"ini",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				-- "latex",
				"lua",
				"luadoc",
				"luap",
				"make",
				"markdown",
				"markdown_inline",
				"nginx",
				"nix",
				"proto",
				"python",
				"php",
				"query",
				"regex",
				"rust",
				"scss",
				"sql",
				"terraform",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
				"zig",
			},

			auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex" },
				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
				-- disable = { "lua" }, -- Only for Neovim version under 0.10.x
			},
		})

		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = false,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
		})

		-- SELECT keymaps
		local sel = require("nvim-treesitter-textobjects.select")
		for _, map in ipairs({
			{ { "x", "o" }, "af", "@function.outer" },
			{ { "x", "o" }, "if", "@function.inner" },
			{ { "x", "o" }, "ac", "@class.outer" },
			{ { "x", "o" }, "ic", "@class.inner" },
			{ { "x", "o" }, "aa", "@parameter.outer" },
			{ { "x", "o" }, "ia", "@parameter.inner" },
			{ { "x", "o" }, "ad", "@comment.outer" },
			{ { "x", "o" }, "as", "@statement.outer" },
		}) do
			vim.keymap.set(map[1], map[2], function()
				sel.select_textobject(map[3], "textobjects")
			end, { desc = "Select " .. map[3] })
		end

		-- MOVE keymaps
		local mv = require("nvim-treesitter-textobjects.move")
		for _, map in ipairs({
			{ { "n", "x", "o" }, "]m", mv.goto_next_start, "@function.outer" },
			{ { "n", "x", "o" }, "[m", mv.goto_previous_start, "@function.outer" },
			{ { "n", "x", "o" }, "]]", mv.goto_next_start, "@class.outer" },
			{ { "n", "x", "o" }, "[[", mv.goto_previous_start, "@class.outer" },
			{ { "n", "x", "o" }, "]M", mv.goto_next_end, "@function.outer" },
			{ { "n", "x", "o" }, "[M", mv.goto_previous_end, "@function.outer" },
			{ { "n", "x", "o" }, "]o", mv.goto_next_start, { "@loop.inner", "@loop.outer" } },
			{ { "n", "x", "o" }, "[o", mv.goto_previous_start, { "@loop.inner", "@loop.outer" } },
		}) do
			local modes, lhs, fn, query = map[1], map[2], map[3], map[4]
			-- build a human-readable desc
			local qstr = (type(query) == "table") and table.concat(query, ",") or query
			vim.keymap.set(modes, lhs, function()
				fn(query, "textobjects")
			end, { desc = "Move to " .. qstr })
		end

		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "*" },
			callback = function()
				local filetype = vim.bo.filetype
				if filetype and filetype ~= "" then
					local success = pcall(function()
						vim.treesitter.start()
					end)
					if not success then
						return
					end
				end
			end,
		})
	end,
}
