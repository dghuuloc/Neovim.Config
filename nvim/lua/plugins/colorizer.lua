return {
    "nvchad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()

        require('colorizer').setup {
            filetypes = {
                "css",
                "scss",
                "html",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "svelte",
            },

            user_default_options = {
                -- mode = "virtualtext";
                RRGGBBAA = true;         -- #RRGGBBAA hex codes
                rgb_fn   = true;         -- CSS rgb() and rgba() functions
                hsl_fn   = true;         -- CSS hsl() and hsla() functions
                css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- virtualtext = "",
                -- always_update = true,
                -- names = false,
                -- sass = { enable = false, parsers = { "css" } },
            },
        }
    end,
}
