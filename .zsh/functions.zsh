FPATH=$ZDOTDIR/functions:$FPATH

autoload -Uz clean-up-swap-files

load() {
  autoload -Uz $1
  zle -N $1
  if [ "$2" != '' ]; then
    bindkey $2 $1
  fi
}

if which fzf > /dev/null; then
  load fzf-history-search '^R'

  load fzf-git-add '^G^A'

  load fzf-git-checkout-branch
  alias gco=fzf-git-checkout-branch
fi
