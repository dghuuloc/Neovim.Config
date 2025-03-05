# <div align="center">Neovim.Config</div>
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<p align="center">
  <img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/1200px-Vimlogo.svg.png" alt="Vim Logo">
   <img width="600" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/1200px-Neovim-logo.svg.png" alt="Neovim Logo">
</p>

---
## Prerequisites
- [Neovim](https://github.com/neovim/neovim) ≥ v0.10.0
- [git](https://git-scm.com/)
- Install [MSYS2](https://www.msys2.org/) or [winstall](https://winstall.app/apps/MartinStorsjo.LLVM-MinGW.MSVCRT) or [clang](https://rust-lang.github.io/rust-bindgen/requirements.html?highlight=LIB)- A C compiler is required to compile the parsers needed for nvim-treesitter and so on. Find out more at [here](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
```shell
$ pacman -Syu
$ pacman -Su
$ pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
```
- Setup `make`
- [fd](https://github.com/sharkdp/fd) - is a program to find entries in your filesystem
- [fzf](https://github.com/junegunn/fzf) - is a general-purpose command-line fuzzy finder
- [ripgrep](https://github.com/BurntSushi/ripgrep) - is a line-oriented search tool that recursively searches the current directory for a regex pattern.

__Optional Install:__
- [jq](https://jqlang.github.io/jq/download/) - is a lightweight and flexible command-line JSON processor
- [xmllint](https://gist.github.com/cbmeeks/8317048) - Fast Tool to Format, Beautify, and Validate XML

## Recommended Fonts
__A [Nerd Fonts](https://www.nerdfonts.com/font-downloads) is required to see all the icons inside neovim. Here, I'm using JetBrainsMono Nerd Font for Windows Terminal Settings__
```
Color scheme:        One Half Dark
Font face:           JetBrainsMonoNL Nerd Font
Font-size:           11
```
## Installation
### Post installation
Below you can find OS specific install instructions for Neovim and dependencies.
#### Windows Installation
<details open><summary>Windows with gcc/make using chocolatey</summary>
Install gcc and make which don't require changing the config, the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit the previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>

### Install Recipes
- __To install on Linux/Mac, open terminal and then run the command below__
```shell
git clone --recursive https://github.com/dghuuloc/Neovim.Config.git ~/.config/nvim
```
- __Windows__
```shell
rm -r -fo $env:LOCALAPPDATA/nvim
rm -r -fo $env:LOCALAPPDATA/nvim-data
git clone --recursive https://github.com/dghuuloc/Neovim.Config.git $env:LOCALAPPDATA/nvim
rm -r -fo $env:LOCALAPPDATA/nvim/.git
```
### __Install Java Debug Server and Test Runner for Java (optional)__
- __Insatall Java Debug Server on Windows__
```shell
git clone --recursive https://github.com/microsoft/java-debug.git $env:LOCALAPPDATA/nvim-data
```

- __Insatall Test Runner for Java on Windows__
```shell
git clone --recursive https://github.com/microsoft/vscode-java-test.git $env:LOCALAPPDATA/nvim-data
```

## Reference
- [lspsaga](https://nvimdev.github.io/lspsaga/)


