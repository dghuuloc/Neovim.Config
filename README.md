# <div align="center">Configuring Neovim with Lua - What You Should Know</div>
---

## How Neovim loads config
Neovim supports using `init.lua` as the configuration file. This should be placed in your config directory:
- Linux, BSD or macOS: `~/.config/nvim`
- Windows: `~/AppData/Local/nvim/`

Although you can put all the settings inside `init.lua`, you probably don’t want to because the file will become large and difficult to manage.

To avoid this, separate files to multiple modules and then load them in the `init.lua` using `require()`. You can place those modules in the `lua/` directory in your `runtimepath` (a list of directories to be searched on startup).

Neovim config structure:
```
~/.config/nvim
|-- init.lua
|-- lua/
|  |-- config/
|  |  |-- options.lua
|  |  |-- mappings.lua
|  |  |-- autocmds.lua
|  |  |-- bootstrap-lazy.lua
|  |-- plugins/
|     |-- autoclose.lua
|     |-- lsp.lua
|       :
```

The first line of `init.lua`:
``` lua
require("config.options")
```
When Neovim reads this line on startup, it goes through the `runtimepath`, search for `lua/` and load `/config/options.lua`. The default `runtimepath` includes `~/.config/nvim`. This is why we put the `lua/` inside it.

#### Notes
- `.` in the module name is treated as a directory separator when searching.
- You don’t need to type the `.lua` extension.
