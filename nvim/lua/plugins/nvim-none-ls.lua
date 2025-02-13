return {
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- for formatting Lua
                null_ls.builtins.formatting.stylua,

                -- for formatting Java/Spring-Boot
                null_ls.builtins.formatting.google_java_format,

                -- for formatting Python
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,

                --[[
                    Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
                    "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "svelte", "astro", "htmlangular" }
                ]]
                null_ls.builtins.formatting.prettier,

            },
        })
    end,
}
