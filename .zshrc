
########################################
## Environments
export LANG=ja_JP.UTF-8

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Doxygen
export PATH=/Applications/Doxygen.app/Contents/Resources:$PATH

# MacTeX
export PATH="/Library/TeX/texbin:$PATH"

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# Cask
export PATH="$HOME/.cask/bin:$PATH"

# 自作Shellscript
export PATH="$HOME/Dropbox/shellscript:$PATH"

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

powerline-daemon -q
# . ~/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
. ${PYENV_ROOT}/versions/3.5.0/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

## cd後自動でls
function chpwd() { gls --color=auto -B }

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド



########################################
# Alias

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls="gls --color=auto -B"
alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# brew doctor実行時、pyenvのPATHを抜く（Waring対策）
alias brew="env PATH=${PATH/\/Users\/Arito\/\.pyenv\/shims:/} brew"

# グローバルエイリアス

alias -g L='| less'
alias -g G='| grep'

# stack Haskell
alias ghc="stack ghc -- "
alias ghci="stack ghci --"
alias runghc="stack runghc -- "
alias runhaskell="stack runghc -- "

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定 (glsを使うためオフに)
# case ${OSTYPE} in
#     darwin*)
#         #Mac用の設定
#         export CLICOLOR=1
#         alias ls='ls -G -F'
#         ;;
#     linux*)
#         #Linux用の設定
#         alias ls='ls -F --color=auto'
#         ;;
# esac

# vim:set ft=zsh:



# pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function find_cd() {
    cd "$(find . -type d | peco)"
}
alias fc="find_cd"

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^=' peco-src

case ${OSTYPE} in
     darwin*)
         #Mac用の設定
         alias em="/usr/local/Cellar/emacs-mac/emacs-25.3-mac-6.8/Emacs.app/Contents/MacOS/Emacs &"
         ;;
 esac
