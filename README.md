# dotfiles

TEWi_R's dotfiles

## Environments

- macOS Sierra 10.12.6
  - [Homebrew](https://brew.sh)
- zsh
- tmux

## Install

### 1. Clone repo

``` shell
$ cd ~
$ git clone https://github.com/RTewi/dotfiles.git
```

<<<<<<< HEAD
### 2. Install 3rd-dependencies
=======
### 1. Install 3rd-dependencies
>>>>>>> fb8b233a3b917e2d78718c04860fd1e0a4b5f9f4

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

### 5. Add Local Setting

``` shell
$ cp $HOME/dotfiles/.zsh/.zshrc_local.temp $HOME/dotfiles/.zsh/.zshrc_local
$ vi $HOME/dotfiles/.zsh/.zshrc_local
add local setting here
```
