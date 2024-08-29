return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
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

                preview = { ls_short = true },
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
                pickers = {
                    live_grep = {
                        theme = "dropdown",
                    },

                    grep_string = {
                        theme = "dropdown",
                    },

                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                    },

                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                        initial_mode = "normal",
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["dd"] = actions.delete_buffer,
                            },
                        },
                    },

                    planets = {
                        show_pluto = true,
                        show_moon = true,
                    },

                    colorscheme = {
                        enable_preview = true,
                    },

                    lsp_references = {
                        theme = "dropdown",
                        initial_mode = "normal",
                    },

                    lsp_definitions = {
                        theme = "dropdown",
                        initial_mode = "normal",
                    },

                    lsp_declarations = {
                        theme = "dropdown",
                        initial_mode = "normal",
                    },

                    lsp_implementations = {
                        theme = "dropdown",
                        initial_mode = "normal",
                    },

                }
            },
        })

        -- get access to telescopes built in functions
        local builtin = require('telescope.builtin')

        -- set a vim motion to <Space> + f + f to search for files by their names
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
        -- set a vim motion to <Space> + f + g to search for files based on the text inside of them
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "[F]ind by [G]rep"})
        -- set a vim motion to <Space> + f + d to search for Code Diagnostics in the current project
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        -- set a vim motion to <Space> + f + r to resume the previous search
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]inder [R]esume' })
        -- set a vim motion to <Space> + f + . to search for Recent Files
        vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
        -- set a vim motion to <Space> + f + b to search Open Buffers
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })

    end,
}
