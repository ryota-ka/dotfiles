HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[p" history-beginning-search-backward-end
bindkey "^[n" history-beginning-search-forward-end

FPATH=$ZDOTDIR/functions:$FPATH
autoload -Uz peco-history-search
zle -N peco-history-search

if which peco > /dev/null; then
  bindkey '^R' peco-history-search
fi
