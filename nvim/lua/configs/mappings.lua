--[[ Set leadermap ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Better window movement ]]
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

--[[ These mappings control the size of splits (height/width) ]]
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

--[[ Tab switch buffer ]]
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true, desc = "Buffer Next"})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true, desc = "Buffer Previous"})

--[[ Better indenting ]]
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

--[[ Move selected line / block of text in visual mode ]]
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- [[ Hide diagnostics ]]
vim.keymap.set("n", "<leader>hd",
    function()
        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
            underline = false,
        })
    end
, {noremap = true, silent = true, desc = "Hide diagnostics"})

-- [[ Show diagnostics ]]
vim.keymap.set("n", "<leader>sd",
function()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
    })
end
, {noremap = true, silent = true, desc = "Show diagnostics"})
