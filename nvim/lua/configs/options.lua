--vim.opt.statusline = "%f%* %m %= [%l,%c]"             -- format statusline
vim.opt.showtabline = 1                                 -- don't show tabline
vim.opt.tabline = "%t"                                  -- format tabline

vim.opt.number = true                                   -- show numbers on the left
vim.opt.relativenumber = true                           -- shows lines numbers starting from the current one.

vim.opt.clipboard = "unnamedplus"                       -- allows neovim to access the system clipboard

vim.opt.tabstop = 4                                     -- insert 4 spaces for a tab
vim.opt.shiftwidth = 4                                  -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4                                 -- number of spaces inserted for <Tab> key
vim.opt.expandtab = true                                -- convert tabs to spaces

vim.opt.smartindent = true                              -- make indenting smarter again

vim.opt.wrap = false                                    -- display lines as one long line (default wrap = true)

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"                              -- always show the sign column, otherwise it would shift the text each tim

vim.opt.hlsearch = true                                 -- highlight all matches on previous search pattern
vim.opt.smartcase = true
vim.opt.ignorecase = true                               -- ignore case in search patterns

vim.opt.splitbelow = true                               -- force all horizontal splits to go below current window
vim.opt.splitright = true                               -- force all vertical splits to go to the right of current window

vim.opt.swapfile = false                                -- create a swapfile

vim.opt.writebackup = false                             -- it is not allowed to be edited in another program

vim.opt.updatetime = 50                                 -- faster completion
