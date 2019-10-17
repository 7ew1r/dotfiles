# dotfiles

TEWi_R's dotfiles

- [fish shell](https://fishshell.com/)
  - [Fisher](https://github.com/jorgebucaran/fisher) (Package manager)
    - decors/fish-ghq
    - oh-my-fish/plugin-balias
    - oh-my-fish/plugin-peco
    - oh-my-fish/theme-bobthefish
- vim
- peco
- ~~zsh~~ [Discontinued]
- ~~tmux~~ [Discontinued]

## Environments

- macOS Mojave 10.14.6
- Ubuntu 18.04

## Requirement

- macOS
  - [Homebrew](https://brew.sh/index_ja)
- Ubuntu
  - [Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux)
- [peco](https://github.com/peco/peco)
- [ghq](https://github.com/motemen/ghq)
- [anyenv](https://github.com/anyenv/anyenv)
- Powerline font


## Installation

### 1. Install the fish shell

```shell
$ brew install fish
```

```shell
$ which fish
/path/to/fish
```

```shell
$ sudo vi /etc/shells
/path/to/fish
```



### 2. Install 3rd-dependencies

```shell
$ brew install peco ghq vim anyenv
````



### 3. Clone repo

``` shell
$ cd ~
$ git clone https://github.com/7ewir/dotfiles.git
```÷

### 4. Run the install script

```shell
$ cd ~/dotfiles
$ sh script/install.sh
```

## Uninstallation

```shell
$ sh script/uninstall.sh
$ rm -rf dotfiles
```