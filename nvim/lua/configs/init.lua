-- Load the options from the config/options.lua file
require("configs.options")

-- Load the keymaps from the config/keymaps.lua file
require("configs.keymaps")

-- Load the auto commands from the config/commands.lua file
require("configs.commands")

----------------------------------------------------------------------------------------------------------------
-- Set up plugin manager for Neovim
----------------------------------------------------------------------------------------------------------------
-- Declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end

-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- Setup lazy, this should always be last
lazy.setup({
    -- import/override with your plugins	
    spec = {
        -- Tell lazy that all plugin specs are found in the plugins directory
        { import = "plugins" },

        -- Add more plugins without configuration
        { "nvim-lua/plenary.nvim" },

        -- Add other plugins here...

    },

    -- Declare a few options for lazy
    change_detection = {
        -- Don't notify us every time a change is made to the configuration
        notify = false,
    },
    checker = {
        -- Automatically check for package updates
        enabled = true,
        -- Don't spam us with notification every time there is an update available
        notify = false,
    }
})
