# <div align="center">Neovim.Config</div>
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<p align="center">
  <img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/1200px-Vimlogo.svg.png" alt="Vim Logo">
   <img width="600" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/1200px-Neovim-logo.svg.png" alt="Neovim Logo">
</p>

---
## Prerequisites
- [Neovim](https://github.com/neovim/neovim) ≥ v0.10.0
- Install [MSYS2](https://www.msys2.org/)
```shell
$ pacman -Syu
$ pacman -Su
$ pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
```
- [git](https://git-scm.com/)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [jq](https://jqlang.github.io/jq/download/)

## Recommended Fonts
__A [Nerd Fonts](https://www.nerdfonts.com/font-downloads) is required to see all the icons inside neovim. Here, I'm using JetBrainsMono Nerd Font for Windows Terminal Settings__
```
Color scheme:        One Half Dark
Font face:           JetBrainsMonoNL Nerd Font
Font-size:           11
```
## Installation 
- __To install on Linux/Mac, open terminal and then run the command below__
```shell
git clone --recursive https://github.com/dghuuloc/Neovim.Config.git ~/.config/nvim
rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim && git clone https://github.com/dghuuloc/Neovim.Config.git ~/.config/nvim
```
- __Windows__
```shell
git clone --recursive https://github.com/dghuuloc/Neovim.Config.git $env:LOCALAPPDATA/nvim
rmdir /S /Q %homepath%\appdata\local\nvim-data & rmdir /S /Q %homepath%\appdata\local\nvim & git clone https://github.com/dghuuloc/Neovim.Config.git %homepath%\appdata\local\nvim
```

