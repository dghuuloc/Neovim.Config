return {
    "ibhagwan/fzf-lua",

    config = function()
       require("fzf-lua").setup({
           initial_mode = "normal"
       })

       -- set a vim motion to search for files by their names
       vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, {desc = "[F]zf [F]iles"})
       -- set a vim motion to search for files based on the text inside of them
       vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep, {desc = "[F]ind by [G]rep"})
       -- set a vim motion to search Open Buffers
       vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = '[F]ind Existing [B]uffers' })

    end
}
