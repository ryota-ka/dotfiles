# use Emacs key bindings
bindkey -e

# enable colors
autoload -Uz colors; colors

# specify word delimiters
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " '\"(),-./:;=@[]{|}"
zstyle ':zle:*' word-style unspecified

# enable zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'

. $ZDOTDIR/completion.zsh
. $ZDOTDIR/functions.zsh
. $ZDOTDIR/history.zsh
. $ZDOTDIR/hooks.zsh
. $ZDOTDIR/prompt.zsh
. $ZDOTDIR/syntax_highlighting.zsh
. $ZDOTDIR/tmux.zsh
. $ZDOTDIR/ls.zsh
. $ZDOTDIR/fzf.zsh
. $ZDOTDIR/git.zsh
