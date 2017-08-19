autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

local pr_cd="%F{cyan}[%~]%f     %1(v|%F{green}%1v%f|)";
local pr_info="%(?.%F{yellow}%}.%F{magenta})%n@%m%f"
PROMPT="
$pr_cd
$pr_info $ ";
RPROMPT=""
