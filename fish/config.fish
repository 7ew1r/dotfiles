function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco history to Ctrl+r
end

set -g GHQ_SELECTOR peco

#anyenv
if test -d $HOME/.anyenv
  set PATH $HOME/bin $HOME/.anyenv/bin $PATH
  anyenv init - fish | source
end

# thefuck
thefuck --alias | source 

set PATH /usr/local/bin /usr/sbin $HOME/development/flutter/bin $PATH

if test -d $HOME/.anyenv
  pyenv init - | source
  pyenv virtualenv-init - | source
end

# balias
balias g git
balias killdss 'find . -name ".DS_Store" | xargs rm'
balias fishrc 'nvim ~/.config/fish/config.fish'
balias nvimrc 'nvim ~/.config/nvim/init.vim'
balias dotfiles 'cd ~/dotfiles'
balias update_env 'sh $HOME/src/github.com/7ew1r/shellscripts/update_env.sh'
balias gcmain 'git config --local user.name "7ew1r" && git config --local user.email "art.sht.0317@gmail.com"'
balias gclas 'git config --local user.name "ashiihata" && git config --local user.email "shiihata@lifearcsystem.co.jp"'


# starship
starship init fish | source

# own scripts
set PATH ~/myscripts $PATH
