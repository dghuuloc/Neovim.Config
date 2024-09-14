vim.api.nvim_exec('language en_US', true)               -- set Neovim language to English
vim.diagnostic.disable()                                -- disable all diagnostic

vim.opt.statusline = "%f%* %m %= [%l,%c]"               -- format statusline
vim.opt.showtabline = 1                                 -- don't show tabline
vim.opt.tabline = "%t"

vim.opt.clipboard = "unnamedplus"                       -- allows neovim to access the system clipboard

vim.opt.cmdheight = 1                                   -- more space in the neovim command line for displaying messages

vim.opt.mouse = "a"                                     -- allow the mouse to be used in neovim

vim.opt.smartcase = true
vim.opt.ignorecase = true                               -- ignore case in search patterns
vim.opt.hlsearch = true                                 -- highlight all matches on previous search pattern

vim.opt.splitbelow = true                               -- force all horizontal splits to go below current window
vim.opt.splitright = true                               -- force all vertical splits to go to the right of current window

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"                              -- always show the sign column, otherwise it would shift the text each time

vim.opt.swapfile = false                                -- create a swapfile

vim.opt.wrap = false                                    -- display lines as one long line (default wrap = true)

vim.opt.tabstop = 4                                     -- insert 4 spaces for a tab
vim.opt.shiftwidth = 4                                  -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4                                 -- number of spaces inserted for <Tab> key
vim.opt.expandtab = true                                -- convert tabs to spaces
vim.opt.smartindent = true                              -- make indenting smarter again

vim.opt.timeoutlen = 1000                               -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                                -- faster completion (4000ms default)

vim.opt.cursorline = true                               -- highlight the current line
vim.opt.writebackup = false                             -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.numberwidth = 2                                 -- set number column width to 2 {default 4}
