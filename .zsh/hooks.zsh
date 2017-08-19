function chpwd() {
  if [ `ls -Al | wc -l` -eq 0 ]; then
    echo "\n\nempty directory";
  else
    echo "\n"
    ls
  fi
}

function preexec() {
    cmd=$(echo $1 | cut -d' ' -f1 )
    tmux rename-window "$cmd:$PWD:t"
}

function precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    tmux rename-window "zsh:$PWD:t"
}
