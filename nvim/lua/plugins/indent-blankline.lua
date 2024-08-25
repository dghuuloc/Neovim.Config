return {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPost", "BufReadPre", "BufNewFile"},

    config = function()
        require("ibl").setup({
            indent = {
                -- char = "│",
                char = "┊",
                -- highlight = { "LineNr" }
            },
            scope = {
                enabled = false,
            },

        })
    end,
}
