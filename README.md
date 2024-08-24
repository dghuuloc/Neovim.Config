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

You can set options via Lua in two ways: `vim.opt` and `vim.o` series. I recommend using `vim.opt` series because it is more Lua-style, you can:
- use `:append()`, `:prepend()` and `:remove()` to manipulate options
- set its value to Lua table

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
Save the lazy.lua file and restart Neovim. Enter :Lazy on the command line to bring up the Lazy plugin manager interface.

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

## References
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Lua-guide](https://neovim.io/doc/user/lua-guide.html)
- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)
