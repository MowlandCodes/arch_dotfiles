-- Basic Configuration of NeoVim
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Search Settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Indentation Settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

-- Visual Settings
vim.opt.winblend = 0
vim.opt.termguicolors = true
vim.opt.cmdheight = 1

-- Scroll Settings
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- File Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.updatetime = 300
vim.opt.autoread = true
vim.opt.autowrite = true

-- Behaviour settings
vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.autochdir = false
vim.opt.path:append("**")
vim.opt.iskeyword:append("-")
vim.opt.selection = "exclusive"

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Create undo directory if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.o.statusline = "%f"
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,"
	.. "i-ci-ve:ver25-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,"
	.. "r-cr:hor20-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,"
	.. "o:hor50"

vim.g.lazyvim_php_lsp = "intelephense"

vim.filetype.add({
	extension = {
		astro = "astro",
		mdx = "mdx",
	},
})

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		spacing = 4,
		prefix = "",
	},
	update_in_insert = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

-- Adding EJS File Type
vim.filetype.add({ extension = { ejs = "ejs" } })
vim.treesitter.language.register("html", "ejs")
vim.treesitter.language.register("javascript", "ejs")
vim.treesitter.language.register("embedded_template", "ejs")
vim.treesitter.language.register("markdown", "mdx")
