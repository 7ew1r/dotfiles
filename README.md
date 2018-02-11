# dotfiles

TEWi_R's dotfiles

## Environments

- macOS Sierra 10.12.6
  - [Homebrew](https://brew.sh)
  - GNU Emacs 25.3.1
- ~~Ubuntu 16.04~~

- zsh
- tmux
- emacs

## Install

### 1. Install 3rd-dependencies

- [peco](https://github.com/peco/peco)
- [ghq](https://github.com/motemen/ghq)
- coreutiles
- ~~Powerline (optional)~~

### 2. Make .zshenv

Add the following on `~/.zshenv`

```shell
export ZDOTDIR=$HOME/.zsh
```

### 3. Run the script

``` shell
$ sh script/install.sh
```

### 4. Add Local Setting

```shell
$ cp $HOME/dotfiles/.zsh/.zshrc_local.temp $HOME/dotfiles/.zsh/.zshrc_local
$ vi $HOME/dotfiles/.zsh/.zshrc_local
add local setting here
```

## Emacs
todo later
