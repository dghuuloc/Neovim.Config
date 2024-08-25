----------------------------------------------------------------------------------------------------------------
--  lua/  configs/ 󰢱 mappings.lua
----------------------------------------------------------------------------------------------------------------

--[[ Set leadermap ]]
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Neo-tree ]]
-- vim.api.nvim_set_keymap('n', '<leader>e', ':neotree filesystem reveal left toggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', {noremap = true, silent = true , desc = "Toggle Explorer"})

--[[ Telescope ]]
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})

--[[ better window movement ]]
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

--[[ resize with arrows ]]
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

--[[ Tab switch buffer ]]
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true, desc = "Buffer Next"})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true, desc = "Buffer Previous"})
vim.api.nvim_set_keymap('', '<leader>bq',':bdelete<CR>', {noremap = true, silent = true, desc = "Buffer Delete"})

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

