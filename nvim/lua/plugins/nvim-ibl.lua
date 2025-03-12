return {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
        require("ibl").setup({
            scope = {
                show_start = false,
            },
            indent = {
                char = '┊',
                tab_char = "┊",
                smart_indent_cap = true,

            },
            whitespace = {
                remove_blankline_trail = true,
            },

            exclude = {
                filetypes = {
                    'help',
                    'NvimTree',
                },
            },

        })
    end

}
