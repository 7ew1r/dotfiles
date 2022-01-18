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
- tmux
- ~~zsh~~ [Discontinued]

## Environments

- macOS Big Sur 11.2.3
- Ubuntu 18.04 (WSL)

## Requirement

- [Homebrew](https://brew.sh/index_ja)
- [peco](https://github.com/peco/peco)
- [ghq](https://github.com/motemen/ghq)
- [anyenv](https://github.com/anyenv/anyenv)
- [powerline](https://github.com/powerline/powerline)
- Powerline font

## Installation

### 1. Install the fish shell

```shell
brew install fish
```

```shell
$ which fish
/path/to/fish
```

```shell
sudo vi /etc/shells # append /path/to/fish at last
```

### 2. Install 3rd-dependencies

```shell
brew install peco ghq vim anyenv
pip install powerline-status
```

### 3. Clone repo

```shell
cd ~
git clone https://github.com/7ewir/dotfiles.git
```

### 4. Run the install script

```shell
cd ~/dotfiles
sh script/install.sh
```

### Git

1. Install node.js
2. Install commitizen

```
npm install -g commitizen
npm install -g cz-conventional-changelog-ja
```

## Uninstallation

```shell
unlink $HOME/.vimrc
unlink $HOME/.tmux.conf
unlink $HOME/.config/nvim
unlink $HOME/.config/peco
unlink $HOME/.config/fish
unlink $HOME/.config/fisher
unlink $HOME/.czrc
unlink $HOME/.tigrc
```
