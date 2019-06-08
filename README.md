# dotfiles

TEWi_R's dotfiles

## Environments

- macOS Mojave 10.14.3 
  - [Homebrew](https://brew.sh)
  - [anyenv](https://github.com/riywo/anyenv)
- zsh
  - Prompt : [pure](https://github.com/sindresorhus/pure)
- ~~tmux~~


## Installation

### 1. Clone repo

``` shell
$ cd ~
$ git clone https://github.com/7ew1r/dotfiles.git
```

### 2. Install 3rd-dependencies

- [peco](https://github.com/peco/peco)
- [ghq](https://github.com/motemen/ghq)
- coreutiles

### 3. Make .zshenv

Add the following on `~/.zshenv`

``` shell
export ZDOTDIR=$HOME/.zsh
```

### 4. Run the script

``` shell
$ sh script/install.sh
```

### 5. Add local settings

``` shell
$ cp $HOME/dotfiles/.zsh/.zshrc_local.temp $HOME/dotfiles/.zsh/.zshrc_local
$ vi $HOME/dotfiles/.zsh/.zshrc_local
add local setting here
```
