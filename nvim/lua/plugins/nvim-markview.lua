return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app ; yarn install",

    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,

}
