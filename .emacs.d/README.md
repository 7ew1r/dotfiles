# Emacs
## Requirments
- [Cask](https://github.com/cask/cask)
- [Pandoc](https://pandoc.org)
- [cmigemo](https://github.com/koron/cmigemo)

### cask
- macOS
``` shell
$ brew install cask
```

- Ubuntu
``` shell
$ curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
```

Add below to .bashrc (or ,zshrc)
``` .bashrc (or .zshrc)
$ export PATH="$HOME/.cask/bin:$PATH"
```

``` shell
$ cask upgrade
$ cd ~/.emacs.d
$ cask
```

### 3rd-party
- macOS
``` shell
$ brew install pandoc cmigemo llvm
```

- Ubuntu

``` shell
$ sudo apt install pandoc cmigemo libclang-dev
```

### codic

Get codic API token from [codic](https://codic.jp/)

``` shell
$ mkdir ~/.emacs.d/spec
$ vi ~/.emacs.d/spec/codic-api-token
codic-api-token
```
