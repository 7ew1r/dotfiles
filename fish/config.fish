function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set -g GHQ_SELECTOR peco

#anyenv
set PATH $HOME/bin $HOME/.anyenv/bin $PATH
anyenv init - fish | source
eval (pyenv init - | source)

# thefuck
thefuck --alias | source 

set PATH /usr/local/bin /usr/sbin $PATH

# balias
balias killdss 'find . -name ".DS_Store" | xargs rm'
balias fishrc 'vim ~/.config/fish/config.fish'
balias update_env 'sh $HOME/src/github.com/7ew1r/shellscripts/update_env.sh'
