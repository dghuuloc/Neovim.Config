----------------------------------------------------------------------------------------------------------------
--  lua/  configs/ 󰢱 options.lua
----------------------------------------------------------------------------------------------------------------

-- language
vim.api.nvim_exec('language en_US', true)

-- basic setups --
local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    encoding = "utf-8",                      -- the encoding written to a file
    hidden = true,                           -- required to keep multiple buffers and open multiple buffers
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    -- pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 1,                         -- always show tabs
    -- winbar = '%=%m %F',
    smartcase = true,                        -- smart case
    smartindent = false,                     -- make indenting smarter again
    autoindent = true,                       -- copy indent from current line when starting new one
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    softtabstop = 4, 		                 -- number of spaces inserted for <Tab> key
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    numberwidth = 2,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h17",               -- the font used in graphical neovim applications

}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');

-- [[ Fillchars ]]
-- vim.opt.fillchars:append('stl: ');
-- vim.opt.fillchars:append('eob: ');          
-- vim.opt.fillchars:append('fold: ');
-- vim.opt.fillchars:append('foldopen: ');
-- vim.opt.fillchars:append('foldsep: ');
-- vim.opt.fillchars:append('foldclose:');

-- [[ File Explore with NetRW Settings ]]
-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- olors
vim.g.t_co = 256
vim.opt.termguicolors = true

-- map close parenthesis in neovim
-- vim.api.nvim_set_keymap('i', '"', '""<left>', {silent = true, noremap = true})
-- vim.api.nvim_set_keymap('i', "'", "''<left>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '(', '()<left>', {silent = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '<', '<><left>', {silent = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '[', '[]<left>', {silent = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '{', '{}<left>', {silent = true, noremap = true})

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Statusline
-- vim.opt.statusline = "%{mode() == 'n' ? '[Normal]' : mode() == 'i' ? '[Insert]' : mode() == 'v' ? '[Visual]' : mode() == 'c' ? '[Command]' : mode() == 't' ? '[Terminal]' : ''} ~ %f%*%m %= %y[%l,%c]"
-- vim.opt.statusline = "%{mode() == 'n' ? '[Normal]' : mode() == 'i' ? '[Insert]' : mode() == 'v' ? '[Visual]' : mode() == 'c' ? '[Command]' : mode() == 't' ? '[Terminal]' : ''} %= %f%*%m"
vim.opt.statusline = "%f%*%m %= [%l,%c]"
vim.opt.tabline = "%f%*%m"
