return {
    -- {
    --     "tjdevries/colorbuddy.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --
    --         -- vim.cmd.colorscheme "gruvbuddy"
    --         vim.cmd([[colorscheme gruvbuddy]])
    --     end,
    -- },

    {
        "rose-pine/neovim",
        config = function()
            vim.cmd([[colorscheme rose-pine]])
        end
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd([[colorscheme tokyonight-storm]])
    --     end,
    -- }
}

