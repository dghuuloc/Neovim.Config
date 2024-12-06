return {
    "nvim-tree/nvim-tree.lua",

    config = function()
        -- disable netrw at the very start
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        
        local HEIGHT_RATIO = 0.8 
        local WIDTH_RATIO = 0.6

        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            respect_buf_cwd = true,
            sync_root_with_cwd = true,

            renderer = {
                root_folder_modifier = "%f",
                group_empty = true,
            },

            update_focused_file = {
                enable = true,
                update_root = {
                    enable = true,
                }
            },

            view = {
                relativenumber = false,
                number = false,

                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                        
                        return {
                            border = "rounded",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },

                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,

            },

        })
        
        --[[ NVIM-TREE KEYMAPS ]]
        -- NvimTree Toggle File Explorer
        vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", {noremap = true, silent = true, desc = " Open or close the tree. Takes an optional path argument"})
        -- NvimTree Toggle File Explorer
        -- vim.keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", {noremap = true, silent = true, desc = "Open the tree if it is closed, and then focus on the tree"})
        -- NvimTree Find File in File Explorer
        -- vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", {noremap = true, silent = true, desc = "Move the cursor in the tree for the current buffer, opening folders if needed"})

    end
}
