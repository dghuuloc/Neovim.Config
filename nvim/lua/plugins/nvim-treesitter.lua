return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ':TSUpdate',

    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- call the treesitter setup function with properties to configure our experience
        treesitter.setup({
            ensure_installed = {
                "vimdoc",
                "lua",
                "java",
                "c"
            },
            -- make sure highlighting it anabled
            highlight = {enable = true},
            -- enable indentation
            indent = {
                enable = false,
                disable = { "html" },
            },
        })
    end,
}
