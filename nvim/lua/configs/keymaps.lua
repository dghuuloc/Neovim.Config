--[[ SET LEADERMAP ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ TAB SWITCH BUFFER ]]
vim.keymap.set('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true, desc = "Buffer Next"})
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true, desc = "Buffer Previous"})

--[[ MOVE SELECTED LINE / BLOCK OF TEXT IN VISUAL MODE ]]
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})
