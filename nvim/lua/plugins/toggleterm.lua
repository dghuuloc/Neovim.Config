return {
    "akinsho/toggleterm.nvim",
    version = "*",

    config = function()
        require("toggleterm").setup({
	        size = 10,
	        open_mapping = [[<C-\>]],
	        shading_factor = 2,
	        direction = "horizontal",    -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
            shell = vim.o.shell,
	        float_opts = {
		        border = "curved",
		        highlights = {
			        border = "Normal",
			        background = "Normal",
		        },
	        },
        })
    end,
}
