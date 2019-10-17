function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set -g GHQ_SELECTOR peco

#anyenv
set PATH $HOME/bin $HOME/.anyenv/bin $PATH
anyenv init - fish | source


set PATH /usr/local/bin /usr/sbin $PATH
