return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function ()
        vim.api.nvim_set_keymap("n", "<leader>pm", "<cmd>MarkdownPreviewToggle<cr>", { silent = true, desc = "Toggle Markdown Preview" })
    end
}

