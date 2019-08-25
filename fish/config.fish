function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set -g GHQ_SELECTOR peco

# anyenv
set -x PATH ~$HOME/.anyenv/bin $PATH
status --is-interactive; and source (anyenv init -|psub)
