-- return {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     build = "cd app && yarn install",
--     init = function()
--         vim.g.mkdp_filetypes = { "markdown" }
--         vim.g.mkdp_browserfunc = function(url)
--             vim.cmd("!xdg-open '" .. url .. "'")
--             vim.cmd("!notify-send 'Markdown Preview' 'Opening in Browser'")
--         end
--     end,
--     ft = { "markdown" },
--     config = function ()
--         vim.api.nvim_set_keymap("n", "<leader>pm", "<cmd>MarkdownPreviewToggle<cr>", { silent = true, desc = "Toggle Markdown Preview" })
--     end
-- }
return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
};
