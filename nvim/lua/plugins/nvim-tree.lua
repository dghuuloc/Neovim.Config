return {
    "nvim-tree/nvim-tree.lua",

    config = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,

            view = {
                width = 30,
            },
            renderer = {
                root_folder_modifier = ":t",
                -- These icons are visible when you install web-devicons
                icons = {
                    -- show = {
                    --     git = false,
                    --     file = true,
                    --     folder = true,
                    --     folder_arrow = true,
                    -- },
                    glyphs = {
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                            arrow_closed = "⏵",
                            arrow_open = "⏷",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "⌥",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "⊖",
                            ignored = "◌",
                        },
                    },
                },
            },

            filters = {
                dotfiles = true,
            },
        })
    end
}
