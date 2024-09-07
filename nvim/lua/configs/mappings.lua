----------------------------------------------------------------------------------------------------------------
--  lua/  configs/ 󰢱 mappings.lua
----------------------------------------------------------------------------------------------------------------

--[[ Set leadermap ]]
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[  Core execution ]]
vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>.lua<CR>', {noremap = true, silent = true , desc = "Execute the current line"})
vim.api.nvim_set_keymap('n', '<leader><leader>x', '<Cmd>source%<CR>', {noremap = true, silent = true , desc = "Execute the current file"})

--[[  NvimTreeToggle ]]
-- vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', {noremap = true, silent = true , desc = "Toggle File Explorer"})

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
vim.api.nvim_set_keymap('', '<leader>bq',':bdelete<CR>', {noremap = true, silent = true, desc = "Buffer Delete"})

--[[ Select All Vim ]]
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {noremap = true, silent = true, desc = ""})

--[[ Better indenting ]]
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

--[[ Better escape ]]
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})

--[[ Move text up and down ]]
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", {noremap = true, silent = true})

--[[ Visual Block ]]
--[[ Move selected line / block of text in visual mode ]]
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

--[[ Toggle the QuickFix window ]]
vim.api.nvim_set_keymap('', '<leader>w', '<Cmd>write<CR>', {noremap = true, silent = true, desc = "Write"})
vim.api.nvim_set_keymap('', '<leader>q', '<Cmd>quit<CR>', {noremap = true, silent = true, desc = "Quit"})
vim.api.nvim_set_keymap('', '<leader>qq','<Cmd>quitall<CR>', {noremap = true, silent = true, desc = "QuitAll"})
vim.api.nvim_set_keymap('', '<leader>Q', '<Cmd>quitall<CR>', {noremap = true, silent = true, desc = "QuitAll"})

--[[ Remove search hightlights after searching ]]
vim.api.nvim_set_keymap('n', '<Esc>', '<Cmd>nohlsearch<CR>', {noremap = true, silent = true})

-- [[ Hide/Show diagnostics ]]
local function hide_diagnostics()
    vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
        virtual_text = false,
        signs = false,
        underline = false,
    })
end
local function show_diagnostics()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
    })
end
vim.keymap.set("n", "<leader>hd", hide_diagnostics, {noremap = true, silent = true, desc = "Hide diagnostics"})
vim.keymap.set("n", "<leader>sd", show_diagnostics, {noremap = true, silent = true, desc = "Show diagnostics"})
