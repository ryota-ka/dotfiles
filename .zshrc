# /usr/local/bin/ を優先
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# zsh-comlpletions の設定
fpath=(/usr/local/Cellar/zsh-completions/0.10.0/share/zsh-completions $fpath)

# site-functions の設定
fpath=(/usr/local/share/zsh/site-functions $fpath)

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
local pr_cd="[%~]     %1(v|%F{green}%1v%f|)";
if [ $SSH_CONNECTION ];then
  local pr_info="%F{197}%n@%m%f";
else
local pr_info="%F{208}%n@%m%f";
fi
PROMPT="
$pr_cd
$pr_info %# ";
RPROMPT=""

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


########################################
# 補完
########################################

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

# enable zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'


########################################
# vcs_info
########################################

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


########################################
# 履歴検索
########################################

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey '^R' history-incremental-pattern-search-backward
bindkey "^S" history-incremental-search-forward

# peco history search
function peco-history-search() {
  local tac
  if which peco > /dev/null 2>&1; then
    if which tac > /dev/null 2>&1; then
      tac='tac'
    elif which gtac > /dev/null 2>&1; then
      tac='gtac'
    else
      tac='tail -r'
    fi
    BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  fi
}

if which peco > /dev/null 2>&1; then
  zle -N peco-history-search
  bindkey '^R' peco-history-search
fi


########################################
# オプション
########################################

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ヒストリをインクリメンタルに追加する
setopt inc_append_history

# Unicode の正規化に関する問題を吸収
setopt combining_chars

# コマンド名が間違っていた場合に修正
setopt correct

zstyle ':completion:*:default' menu select=1
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


########################################
# エイリアス
########################################

alias la='ls -A'
alias ll='ls -lh'

alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g grep='grep --colour=auto'
alias -g grepc='grep --colour=always'
alias -g less='less -R'


########################################
# OS 別の設定
########################################
case ${OSTYPE} in
  darwin*)
    # Mac用の設定
    export CLICOLOR=1
    alias ls='ls -G -F'
    ;;
  linux*)
    # Linux用の設定
    ;;
esac


########################################
# その他設定
########################################

# cd 後の処理
function chpwd() {
  if [ `ls -Al | wc -l` -eq 0 ]; then
    echo "\n\nempty directory";
  else
    echo "\n"
    ls
  fi

  if which tmux >/dev/null 2>&1; then
    tmux rename-window "zsh:$PWD:t";
  fi
}

# Emacs キーバインド
bindkey -e

# tmux の設定・実行
if which tmux >/dev/null 2>&1; then
  alias tmux="TERM=screen-256color-bce tmux"
  which tmux 2>&1 >/dev/null && [ -z $TMUX ] && (tmux -2 attach || tmux -2 new-session)
  tmux rename-window "zsh:$PWD:t";
fi

# alias hub as git
if which hub >/dev/null 2>&1; then
  alias git=hub
fi
