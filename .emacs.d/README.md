# Emacs

GNU Emacs 25.3.1

## Requirments
- [Cask](https://github.com/cask/cask)
- [Pandoc](https://pandoc.org)
- [cmigemo](https://github.com/koron/cmigemo)

### cask

``` shell
$ brew install cask # Homebrew
or
$ curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
```

Add below to .bashrc (or ,zshrc)

``` .bashrc (or .zshrc)
$ vi .bashrc
export PATH="$HOME/.cask/bin:$PATH"
$ source ~/.bashrc
```

``` shell
$ cask upgrade
$ cd ~/.emacs.d
$ cask
```

### 3rd-party

``` shell
$ brew install pandoc cmigemo llvm # Homebrew
or
$ sudo apt install pandoc cmigemo libclang-dev # Ubuntu
```

### codic

Get codic API token from [codic](https://codic.jp/)

``` shell
$ mkdir ~/.emacs.d/spec
$ vi ~/.emacs.d/spec/codic-api-token
"codic-api-token"
```
