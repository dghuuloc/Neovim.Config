----------------------------------------------------------------------------------------------------------------
--  lua/  configs/ 󰢱 init.lua
----------------------------------------------------------------------------------------------------------------

-- Declare the path where lazy will clone plugin code
-- [install_path on Windows] ==> C:\Users\<<user_name>>\AppData\Local\nvim-data\lazy\lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end

end

-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Load the options from the config/options.lua file
require("configs.options")

-- Load the keymaps from the config/keymaps.lua file
require("configs.mappings")

-- Load the auto commands from the config/autocmds.lua file
-- require("configs.autocmds")

-- Setup lazy, this should always be last
-- Tell lazy that all plugin specs are found in the plugins directory
-- Pass it the options we specified above
require("lazy").setup({
	-- import/override with your plugins	
	spec = {
    		-- import your plugins
    		{ import = "plugins" },
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

