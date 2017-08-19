autoload -Uz clean-up-swap-files

autoload -Uz peco-history-search
autoload -Uz peco-select-gitadd

zle -N peco-select-gitadd
bindkey "^g^a" peco-select-gitadd
