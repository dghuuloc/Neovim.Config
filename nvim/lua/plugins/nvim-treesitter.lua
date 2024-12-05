return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    -- when the plugin builds run the TSUpdate command to ensure all our servers are installed and updated
    build = ':TSUpdate',

    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- call the treesitter setup function with properties to configure our experience
        treesitter.setup({
            -- make sure we have vim, vimdoc, lua, java, javascript, typescript, html, css, json, tsx, markdown, markdown, inline markdown and gitignore highlighting servers
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
