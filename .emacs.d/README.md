# Emacs
## requirments
- [Cask](https://github.com/cask/cask)
- [Pandoc](https://pandoc.org)
- [cmigemo](https://github.com/koron/cmigemo)
### cask
- macOS
``` shell
brew install cask
```

- Ubuntu
``` shell
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
```

``` .bashrc (or .zshrc)
+ PATH="$HOME/.cask/bin:$PATH"
```

``` shell
cask upgrade
cd ~/.emacs.d
cask
```
### pandoc
- macOS
``` shell
brew install pandoc
```

- Ubuntu

``` shell
sudo apt-get install pandoc
```

