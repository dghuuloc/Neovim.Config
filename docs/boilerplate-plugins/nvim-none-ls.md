```lua return {
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- for formatting Lua
                null_ls.builtins.formatting.stylua,

                -- for formatting Java
                null_ls.builtins.formatting.google_java_format,

                -- for formatting xml

            },
        })
    end,
}```
