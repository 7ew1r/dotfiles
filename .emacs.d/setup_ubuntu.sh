#!/bin/sh
yes "" | sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install -y curl emacs25

#install cask
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
echo "export PATH="$HOME/.cask/bin:$PATH""  >> .bashrc
cask upgrade
cd ~/.emacs.d
cask
