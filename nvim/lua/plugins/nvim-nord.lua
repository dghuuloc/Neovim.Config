return {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        -- Load the colorscheme
        require('nord').set()

        vim.cmd.colorscheme('nord')
    end
}
