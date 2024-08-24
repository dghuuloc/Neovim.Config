# <div align="center">Configuring Neovim with Lua - What You Should Know</div>
---

## How Neovim loads config
Neovim supports using `init.lua` as the configuration file.If you have configured neovim before, it's similar to the `init.vim` file or `vimrc` in Vim. This should be placed in your config directory:
- Linux, BSD or macOS: `~/.config/nvim`
- Windows: `~/AppData/Local/nvim/`

Although you can put all the settings inside `init.lua`, you probably don’t want to because the file will become large and difficult to manage.

To avoid this, separate files to multiple modules and then load them in the `init.lua` using `require()`. You can place those modules in the `lua/` directory in your `runtimepath` (a list of directories to be searched on startup).

## The local configuration directory structure
Understanding the directory structure can be a headache for new users. When Neovim launches, it searches first for the _~/.config/nvim_ directory and expects the following files and directories to be present.

> [!NOTE]
> Note: The list of searched-for directories can also be found by typing `:h runtimepath` on the Neovim command line
> 
```
~/.config/nvim or ~/AppData/Local/nvim/
├── after
│   └── plugin                        <-- directory for plugin configurations
│       ├── autopairs.lua
        ├── ...
|-- init.lua                          <-- init file
|-- lua/
|  |-- config/
|  |  |-- options.lua
|  |  |-- mappings.lua
|  |  |-- autocmds.lua
|  |  |-- lazy.lua                    <-- plugin manager file
|  |-- plugins/
|     |-- autoclose.lua
|     |-- lsp.lua
|       :
└── plugin
    └── packer_compiled.lua
```
The `/after` directory contains files to be loaded after the `init.lua` script has run.
The `/lua` directory contains the plugins configured in Lua.
Both `/plugin` and `/config` directories are searched for runtime files.

## init.lua
The first line of `init.lua`:
``` lua
require("config.options")
```
When Neovim reads this line on startup, it goes through the `runtimepath`, search for `lua/` and load `/config/options.lua`. The default `runtimepath` includes `~/.config/nvim`. This is why we put the `lua/` inside it.

> [!NOTE]  
> - `.` in the module name is treated as a directory separator when searching.
> - You don’t need to type the `.lua` extension.

> [!NOTE]
> you can still use vimscript if you really need by using vim.cmd[],
> ```lua
> vim.cmd [[
>     #vim script goes here!
>     syntax enable
> ]]

## Options
Some of functions and meta-accessors:
- `vim.o` - for general settings
- `vim.wo` - for for window-scoped options.
- `vim.bo` - for for buffer-scoped settings.
- `vim.g` - for for global variables, which you're commonly use for plugins.
- `vim.opt` - to set global, window, and buffer options. Basiclly :set

### vim.g
This is for global commands, basically anything in the `let g:***` Vimscript namespace. For example, `let g:mapleader = " "` becomes `vim.g.mapleader = " "`

### vim.o
This will likely be the bread and butter of your migration, as it's the most consistent 1:1 mapping of `set` options and Lua expressions. See for yourself:
```lua
vim.o.spell = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.synmaxcol = 30
```

### vim.opt
This is a special Lua table (read: hash map or associative array) that allows you to use more Lua-friendly syntax to set options.

For example, `vim.opt.listchars` is pretty nice:
```lua
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}
```

### vim.api: Keymapping and Autocommands
For more advanced functionality like keymapping and autocommands, you have `vim.api`
```lua
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "rust",
    callback = function()
        vim.api.nvim_buf_set_option(0, "tabstop", 4)
        vim.api.nvim_buf_set_option(0, "shiftwidth", 4)
        vim.api.nvim_buf_set_option(0, "softtabstop", 4)
    end
})
```

```lua
vim.api.nvim_set_keymap('n', '<leader>s', ':split<CR>',
    { noremap = true })
```

## Keymap
Add a new mapping:
```lua
vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
```
- {mode} (string or table) mode short-name
  - "": Normal, Visual, Select, Operator-pending mode
  - "n": Normal mode
  - "v": Visual and Select mode
  - "s": Select mode
  - "x": Visual mode
  - "o": Operator-pending mode
  - "i": Insert mode
  - "t": Terminal mode
  - "!": Insert Insert and Command-line mode
- {lhs}: (string) left-hand side of the mapping, the keys we want to map
- {rhs}: (string or function) right-hand side of the mapping, the keys or function we want to execute after pressing {lhs}
- {opts}: (table) optional parameters
  - silent: define a mapping that will not be echoed on the command line
  - noremap: disable recursive mapping

``` lua
-- map leader+w to save current file in normal mode
vim.keymap.set("n", "<Leader>w", ":write<CR>", { noremap = true, silent = true })

-- map leader+y to copy to system clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })
```
## Auto Conmmands
Create an autocommand envent handler:
```lua
nvim_create_autocmd({event}, "*opts})
```
{event}: (String or array) events that will trigger the handler
- BufEnter: after entering a buffer
- CmdlineLeave: before leaving the command-line
{opts}: options
- pattern (string or array): pattern to match
- callback (function or string): Lua function called when the event is triggered

```lua
-- set tab to 3 space when entering a buffer with .lua file
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.lua" },
   callback = function()
      vim.opt.shiftwidth = 3
      vim.opt.tabstop = 3
      vim.opt.softtabstop = 3
   end
})
```
## Setting Options
If you've used Neovim, you're probably already familiar with several of these options, but if you're not, here's an explanation of each one:
- `background=dark`: apply the color set to dark screens. Not just the background of the screen, as it may seem.
- `clipboard=unnamedplus`: enables the clipboard between Neovim and other system programs.
- `completeopt`: modifies the behavior of the auto-complete menu to behave more like an IDE.
- `cursorline`: highlights the current line in the editor.
- `expandtab`: turns tabs into spaces.
- f`oldexpr and foldmethod`: these options were added to improve the code folding behavior in TreeSitter.
- `hidden`: hide unused buffers.
- `inccommand=split`: show replacements in a split window, before applying to the file.
- `mouse=a`: allows the use of the mouse.
- `number`: shows the line numbers.
- `relativenumber`: shows lines numbers starting from the current one. Useful to assist in commands that use more lines.
- `shiftwidth=2`: number of spaces when indenting the text.
- `splitbelow and splitright`: change the behavior of splitting the screen with the command :split (split the screen - horizontally) and :vsplit (vertically). In this case, the screens will always split below the current screen and to the right.
- `swapfile = false`: inhibit the creation of Vim .swp files.
- `tabstop=2`: number of spaces for tabs.
- `termguicolors`: expands the number of usable colors, if the terminal emulator supports it.
- `title`: shows the title of the file.
- `ttimeoutlen=0`: time in milliseconds to accept commands.
- `updatetime`: time in milliseconds that language servers use to check for errors.
- `wildmenu`: shows a more advanced menu for autocomplete suggestions.



## Plugins
Install `lazy.nvim` to manage plugins. We need to instal it first. Remember to `require("config.lazy")` in `init.lua`

```lua
-- lua/config/bootstrap-lazy.lua
-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup("plugins")
```
Save the `lazy.lua` file and restart Neovim. Enter `:Lazy` on the command line to bring up the Lazy plugin manager interface.

The command on the last line loads all the `.lua` file under `lua/plugins/` and the returned table will be merged and passed to `setup()`.
```lua
-- lua/plugins/autoclose.lua
return {
   {
      "m4xshen/autoclose.nvim",
      opts = {
         options = {
            disabled_filetypes = { "text" },
            disable_when_touch = true,
            pair_spaces = true,
         },
      },
   },
   "windwp/nvim-ts-autotag",
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
         require("nvim-surround").setup({
            keymaps = {
               normal = "gs",
               normal_cur = "gss",
            },
         })
      end,
   },
}
```
In the returned table, the first line is the plugin's short url and the rest are arguments(optional) to set plugins up:
- `config`: Function that is exwcuted when the plugin loads. The default implementation will run `require("plugin").setup(opts)`.
- `opts`: Passing options to the `config` function.
- `init`: Functions that is executed during startup.

## Configure the plugins after they are loaded
After plugins are loaded using Lazy, Neovim looks for files in the ~/.config/nvim/after/plugin/ directory to configure them. Every .lua file in this directory is sourced for configuration regardless of naming convention. While this means that you could configure all the plugins in a single file called single_file.lua, this file would be disorganized, large, and difficult to navigate. 

## References
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Lua-guide](https://neovim.io/doc/user/lua-guide.html)
- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)
- [From modal text editor to full-featured IDE on Fedora Workstation](https://fedoramagazine.org/configuring-neovim-on-fedora-as-an-ide-and-using-lazyvim/)
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
- [Where X=Lua](https://learnxinyminutes.com/docs/lua/)
- [Where X=Vimscript](https://learnxinyminutes.com/docs/vimscript/)
- [Everything you need to know to configure neovim using lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
- [Learn How to Use the Vim Text Editor](https://www.youtube.com/watch?v=wACD8WEnImo&list=PLT98CRl2KxKHy4A5N70jMRYAROzzC2a6x)
- [How to Do 90% of What Plugins Do (With Just Vim](https://www.youtube.com/watch?v=XA2WjJbmmoM&t=150s)
- [vimcolorschemes](https://vimcolorschemes.com/i/top/b.dark/e.neovim)
- [A Vim Configuration Primer for Filetype-Specific Workflows](https://ejmastnak.com/tutorials/vim-latex/vimscript/)
- [Vimrc Configuration Guide](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)
