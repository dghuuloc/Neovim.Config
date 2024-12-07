```lua
return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                initial_mode = "normal",

                sorting_strategy = "ascending",

                layout_strategy = "horizontal",         -- value: {horizontal, vertical}

                layout_config = {
					--  prompt_position = 'top',
					width = 200
                    --  width = 0.5
                },

                -- preview = { ls_short = true },
                path_display = { "truncate " },

                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["q"] = actions.close,
                    },
                },
            },
        })

        -- set a vim motion to search for files by their names
        vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, {desc = "[F]ind [F]iles"})
        -- set a vim motion to search for files based on the text inside of them
        vim.keymap.set('n', '<leader>fg', require("telescope.builtin").live_grep, {desc = "[F]ind by [G]rep"})
        -- set a vim motion to search Open Buffers
        vim.keymap.set('n', '<leader>fb', require("telescope.builtin").buffers, { desc = '[F]ind Existing [B]uffers' })

    end,
}
```
