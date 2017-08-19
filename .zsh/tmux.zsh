if which tmux > /dev/null; then
  [ -z $TMUX ] && (tmux -2 attach || tmux -2 new-session)
fi
