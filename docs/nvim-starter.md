# <div align="center">Configuring Neovim with Lua - What You Should Know</div>
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<p align="center">
  <img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/1200px-Vimlogo.svg.png" alt="Vim Logo">
   <img width="600" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/1200px-Neovim-logo.svg.png" alt="Neovim Logo">
</p>

---
## How Neovim loads config
Neovim supports using `init.lua` as the configuration file.If you have configured neovim before, it's similar to the `init.vim` file or `vimrc` in Vim. This should be placed in your config directory:
- Linux, BSD or macOS: `~/.config/nvim`
- Windows: `~/%USERPROFILE%/AppData/Local/nvim/`

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
To set keymaps in Lua, you have mainly two options: `vim.api.nvim_set_keymap({mode}, {lhs}, {rhs}, {opts})` or `vim.keymap.set({mode}, {lhs}, {rhs}, {opts})`, where the latter is basically a wrapper for the former. The main difference in terms of configuration is that using `vim.keymap.set` allows you to assign a mapping to a Lua function in a more elegant way. Here are examples for both:
```lua
-- opts set in a table to not repeat them everytime
local opts = { noremap = true, silent = true }
-- (mode, lhs, rhs, options)
-- lhs = keys to be mapped, rhs = command executed
vim.api.nvim_set_keymap("v", ">", ">gv", opts) -- like vnoremap

-- (mode, lhs, rhs, options)
-- here mode can be a either string or a table
-- rhs can be either a string with commands or a lua function
function my_func()
    vim.cmd([[echo "hello world"]]) -- this is a string
end
vim.keymap.set({"v", "n"}, ">", my_func, opts)

-- map a command
vim.keymap.set("v", "<leader>a", ":wq<CR>", opts)
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
- `clipboard=unnamedplus`: Allows Neovim to use the system clipboard for copy-paste operations. With this setting, anything you yank or delete in Neovim is also available in the system clipboard, making it accessible to other applications.
- `completeopt`: modifies the behavior of the auto-complete menu to behave more like an IDE.
- `cursorline`: Highlights the current line by displaying a horizontal line across the entire width of the window.
- `foldexpr and foldmethod`: these options were added to improve the code folding behavior in TreeSitter.
- `hidden`: Allows you to switch between buffers without saving changes. When you switch buffers, Neovim hides the current buffer instead of closing it.
- `inccommand=split`: show replacements in a split window, before applying to the file.
- `mouse=a`: allows the use of the mouse.
- `number`: Displays line numbers on the left side of the buffer, making it easier to navigate and reference specific lines.
- `smartindent`: Improves indentation for specific programming languages by automatically adjusting the indent level based on the code syntax.
- `autoindent`: Automatically indents new lines based on the indentation level of the previous line. It helps maintain proper code formatting.
- `expandtab`: Converts tab characters to spaces when you press the Tab key. It helps maintain consistent indentation across different systems.
- `relativenumber`: shows lines numbers starting from the current one. Useful to assist in commands that use more lines.
- `shiftwidth=4`: Sets the number of spaces used for each level of indentation when using the Shift+> or Shift+< commands.
- `splitbelow and splitright`: change the behavior of splitting the screen with the command :split (split the screen - horizontally) and :vsplit (vertically). In this case, the screens will always split below the current screen and to the right.
- `swapfile = false`: inhibit the creation of Vim .swp files.
- `tabstop=4`: Sets the number of spaces that a tab character occupies when displayed or inserted.
- `termguicolors`: expands the number of usable colors, if the terminal emulator supports it.
- `title`: shows the title of the file.
- `timeoutlen=0`: time in milliseconds to accept commands.
- `updatetime`: time in milliseconds that language servers use to check for errors.
- `wildmenu`: shows a more advanced menu for autocomplete suggestions.
- `history=5000`: Specifies the maximum number of commands that can be stored in the command-line history. In this case, it allows for up to 5000 entries.
- `encoding=utf8`: Sets the character encoding to UTF-8, which is a widely used encoding for handling Unicode characters.
- `mouse=a`: Enables mouse support in Neovim, allowing you to use the mouse to interact with the editor.

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

## NetRW: Vim's default file manager 
When opening Vim or Neovim using the `[n]vim .` command to open the project directory, the file listing will appear inside it. It can also be opened using the `:Ex` ,`:Vex` or `:Sex` commands.

You can use it with the default settings, but personally, some things bother me, so I used the following settings:

```lua
-- File Browser
vim.g.netrw_banner=0
vim.g.netrw_liststyle=0
vim.g.netrw_browse_split=4
vim.g.netrw_altv=1
vim.g.netrw_winsize=25
vim.g.netrw_keepdir=0
vim.g.netrw_localcopydircmd='cp -r'
```
Here's the emplanation:
- `netrw_banner=0`: hides the top banner that appears by default.
- `netrw_liststyle=0`: change the display of files.
  - `0` shows only one directory at a time.
  - `1` shows file data.
  - `2` shows files in columns.
  - `3` shows as a tree where open directories are expanded.
- `netrw_browse_split=4`: changes how files are opened.
  - `1` opens files in a horizontal split.
  - `2` opens in a vertical split.
  - `3` opens in a new tab.
  - `4` opens in a previous window, avoiding the creation of more divisions.
- `netrw_altv=1`: switches the NetRW display to the left.
- `netrw_winsize=25`: limits window size to 25% of available screen space.
- `netrw_keepdir=0`: keeps the directory you accessed previously.
- `netrw_localcopydircmd`: modifies the command used to copy files. By default, NetRW just copies empty folders. To change this, I set the default command to cp -r so that the copy occurs recursively.

To make creating files easier, I've added more settings:
```vim
" This is a vimscript, if you're using Lua, you should convert this script into your configuration
" Create file without opening buffer
function! CreateInPreview()
  let l:filename = input('please enter filename: ')
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
  redraw!
endfunction

" Netrw: create file using touch instead of opening a buffer
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

augroup auto_commands
    autocmd filetype netrw call Netrw_mappings()
augroup END
```
This prevents NetRW from opening an empty screen just to create a file.

> [!WARNING]
> __NetRW and its problems:__
> There are several criticisms of NetRW for the way it causes a buffer mess. From what I've researched, it seems that using `netrw_liststyle=3` tree mode tends to make this behavior worse. Errors are random, making fixing it a difficult process, and updating only NetRW is more complex than it should be.

### __Netrw quick reference__
| Map | Action |
|-----|--------|
| &lt;F1&gt; | Causes Netrw to issue help |
| &lt;cr&gt; | Netrw will enter the directory or read the file |
| &lt;del&gt; | Netrw will attempt to remove the file/directory |
| - | Makes Netrw go up one directory |
| a | Toggles between normal display, hiding (suppress display of files matching g:netrw_list_hide) showing (display only files which match g:netrw_list_hide) |
| c | Make browsing directory the current directory |
| C | Setting the editing window |
| d | Make a directory |
| D | Attempt to remove the file(s)/directory(ies) |
| gb | Go to previous bookmarked directory |
| gh | Quick hide/unhide of dot-files |
| &lt;c-h&gt; | Edit file hiding list |
| i | Cycle between thin, long, wide and tree listings |
| &lt;c-l&gt; | Causes Netrw to refresh the directory listing |
| mb | Bookmark current directory |
| mc | Copy marked files to marked-file target directory |
| md | Apply diff to marked files (up to 3) |
| me | Place marked files on arg list and edit them |
| mf | Mark a file |
| mh | Toggle marked file suffices' presence on hiding list |
| mm | Move marked files to marked-file target directory |
| mp | Print marked files |
| mr | Mark files satisfying a shell-style |regexp| |
| mt | Current browsing directory becomes markfile target |
| mT | Apply ctags to marked files |
| mu | Unmark all marked files |
| mx | Apply arbitrary shell command to marked files |
| mz | Compress/decompress marked files |
| o | Enter the file/directory under the cursor in a new browser window. A horizontal split is used. |
| O | Obtain a file specified by cursor |
| p | Preview the file |
| P | Browse in the previously used window |
| qb | List bookmarked directories and history |
| qf | Display information on file |
| r | Reverse sorting order |
| R | Rename the designed file(s)/directory(ies) |
| s | Select sorting style: by name, time or file size |
| S | Specify suffix priority for name-sorting |
| t | Enter the file/directory under the cursor in a new tab |
| u | Change to recently-visited directory |
| U | Change to subsequently-visited directory |
| v | Enter the file/directory under the cursor in a new browser window. A vertical split is used. |
| x | View file with an associated program |
| X | Execute filename under cursor via |system()| |
| % | Open a new file in netrw's current directory |

----------
## References
- [The Neovim Path](https://www.sherpa.guide/paths/neovim)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Vim cheatsheet](https://devhints.io/vim)
- [How to get human rights in Neovim without plugins](https://boltlessengineer.github.io/posts/neovim-config-without-plugins/)
- [Write a Neovim Plugin with Lua](https://www.linode.com/docs/guides/write-a-neovim-plugin-with-lua/)
- [How to write a neovim plugin in lua](https://miguelcrespo.co/posts/how-to-write-a-neovim-plugin-in-lua/)
- [LuaScript Boilerplate](https://teukka.tech/luanvim.html)
- [moving from vimscript to lua in neovim](https://www.pondo.dev/blog/lua_with_neovim)
- [Vim_Config_NO_PLUGINS](https://github.com/YanivZalach/Vim_Config_NO_PLUGINS)
- [Neovim-tui.ninja](https://tui.ninja/neovim/)
- [Boost your coding with Nvim](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet/)
- [My lazy neovim config](https://dev.to/voyeg3r/my-lazy-neovim-config-3h6o)
- [Configuring Neovim with development experience in mind](https://dev.to/tolomeo/configuring-neovim-for-maintenance-and-usability-1gbl)
- [NeoVim setup in Lua for OCaml development](https://nyinyithan.com/nvim-setup-ocaml/)
- [How I made my Neovim statusline in Lua](https://elianiva.my.id/posts/neovim-lua-statusline/)
- [Neovim Beginner's Guide: Basic Configuration](https://youngxhui.top/en/2023/07/nvim-guideline-1basic-config/)
- [From init.vim to init.lua - a crash course](https://www.notonlycode.org/neovim-lua-config/)
- [The NEOVIM IDE Series](https://medium.com/@shaikzahid0713/the-neovim-series-32163eb1f5d0)
- [An Experienced (Neo)Vimmer's Workflow](https://seniormars.com/posts/neovim-workflow/)
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
- [NeoVim Lua configuration for PHP and JavaScript (WordPress, Gutenberg) development](https://marioyepes.com/blog/neovim-ide-with-lua-for-web-development/)
