-- Basic Configuration of NeoVim
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set mouse=a")
vim.cmd("set nohlsearch")
vim.cmd("set clipboard=unnamedplus")
vim.opt.expandtab = true
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt["softtabstop"] = 4
vim.o.statusline = "%f"
vim.opt.smartindent = true
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,"
    .. "i-ci-ve:ver25-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,"
    .. "r-cr:hor20-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250,"
    .. "o:hor50"

vim.opt.wrap = true
vim.g.lazyvim_php_lsp = "intelephense"

vim.diagnostic.config({
    underline = true,
    virtual_text = {
        spacing = 4,
        prefix = "",
    },
    update_in_insert = false,
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
