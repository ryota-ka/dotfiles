autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%s: %b'
zstyle ':vcs_info:*' actionformats '%s: %b (%a)'

PROMPT="
%F{blue}[%~]%f %1(v|%F{green}%1v%f|)
%(?.%F{yellow}%}.%F{red})$%f "
