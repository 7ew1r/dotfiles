# TEWi_R's .zshrc
# LANG
export LANG=ja_JP.UTF-8

# load .zshrc_*
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

# 色を使用出来るようにする
autoload -Uz colors
colors

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#### Prompt ################################################################
if [ -e $POWERLINEFILEPATH ]; then
    powerline-daemon -q
    . $POWERLINEFILEPATH
else
    PROMPT="%~ %# "
fi

#### Functions ################################################################
function chpwd() { gls --color=auto -B } # ls after cd

function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history

function find_cd() {
    cd "$(find . -type d | peco)"
}

function peco-select-ghq () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-select-ghq

#### Keybinding ################################################################
bindkey -e               # emacs-like keybind
bindkey '^r' peco-select-history
bindkey '^=' peco-select-ghq

#### Aliases ################################################################
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls="gls --color=auto -B"
alias mkdir='mkdir -p'
alias sudo='sudo ' # enable aliases after 'sudo'

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

alias fc="find_cd"

#### Options ################################################################
# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt append_history       # don't _overwrite_ history
setopt inc_append_history   # append history as command are entered
setopt share_history        # share history between shells
setopt hist_verify          # allow correction of !-expressions before running them
setopt hist_ignore_dups     # don't save duplicate entries in history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks   # delete extra spaces
setopt hist_ignore_space    # don't save entries started space
setopt hist_no_store        # don't save 'history' cmd in history
setopt extended_history     # add timestamps to history

# Correction
setopt dvorak
setopt correct
setopt correctall

# Safe rm
setopt rm_star_wait         # Wait 10 seconds before executing "rm *"
setopt no_rm_star_silent

# Directory Changing
# setopt auto_cd            # Automatically change directory
setopt auto_pushd           # Use "pushd" instead of "cd", enabling use of "popd"
setopt pushd_silent         # Make "popd" be less verbose (like cd)
setopt pushd_ignore_dups    # Don't record the same directory as multiple entries
DIRSTACKSIZE=10             # Limit the number of directories to keep in history

# Comletion, expansion and globbing
setopt auto_menu
setopt auto_list
setopt complete_in_word
setopt always_to_end
setopt menu_complete
setopt list_packed
setopt extended_glob
setopt glob_dots            # don't require a leading ‘.’ in a filename to be matched explicitly
setopt numeric_glob_sort

# Misc
setopt print_eight_bit      # enable print eight bit characters (e.g Japanese)
setopt no_beep
setopt no_flow_control
setopt ignore_eof           # don't exit when press 'C-d'
setopt interactive_comments # allow comments even in interactive shells

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

#### Completion ################################################################
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
