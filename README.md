# dotfiles

```
      _|              _|          _|_|  _|  _|
  _|_|_|    _|_|    _|_|_|_|    _|          _|    _|_|      _|_|_|
_|    _|  _|    _|    _|      _|_|_|_|  _|  _|  _|_|_|_|  _|_|
_|    _|  _|    _|    _|        _|      _|  _|  _|            _|_|
  _|_|_|    _|_|        _|_|    _|      _|  _|    _|_|_|  _|_|_|

```

## Environments
- macOS Sierra 10.12.6
  - [Homebrew](https://brew.sh)
  - GNU Emacs 25.3.1
- Ubuntu 16.04

## zsh
### required
- peco
- ghq
- coreutiles
- Powerline (optional)

Add the following on `.zshenv`

``` shellsession
export ZDOTDIR=$HOME/.zsh
```

```shell
$ cp $HOME/dotfiles/.zsh/.zsh_local.temp $HOME/dotfiles/.zsh/.zsh_local
$ vi $HOME/dotfiles/.zsh/.zsh_local
add local setting here
```

## tmux

## emacs

## TODO
- install.sh
