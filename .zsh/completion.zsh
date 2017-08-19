FPATH=/usr/local/share/zsh-completions:$FPATH
FPATH=/usr/local/share/zsh/site-functions:$FPATH

autoload -Uz compinit; compinit

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:aliases'    list-colors '=*=34'
zstyle ':completion:*:builtins'   list-colors '=*=35'
zstyle ':completion:*:commands'   list-colors '=*=33'
zstyle ':completion:*:options'    list-colors '=^(-- *)=36'
zstyle ':completion:*:parameters' list-colors '=*=32'

# ignore cases on completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# do not complete current directory after ../
zstyle ':completion:*' ignore-parents parent pwd ..

# complete commands after sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# complete process name after ps command
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

zstyle ':completion:*' use-cache true

zstyle '*' single-ignored show

zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' group-name ''

zstyle ':completion:*:messages' format '
%F{magenta}%d%f'

zstyle ':completion:*:corrections' format '
%B%F{yellow}%d%f %F{red}(errors: %e)%f%b'

zstyle ':completion:*:descriptions' format '
%F{yellow}%B%d%b%f'

zstyle ':completion:*:options' description 'yes'

zstyle ':completion:*:warnings' format '%F{red}No matches found%f'

zstyle ':completion:*:*files' ignored-patterns '.git'

# display "do you wish to see all M possibilities (N lines)?" message
# only when the completion possibilities are beyond the screen size
LISTMAX=0
