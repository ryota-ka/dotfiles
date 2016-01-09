function fish_prompt
  set -l exit_code $status
  set -l current_dir (pwd | sed "s%$HOME%~%")
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

  echo ''
  set_color blue

  if [ -z $git_branch ]
    echo "[$current_dir]"
  else
    echo -n "[$current_dir]"
    set_color green
    echo '  ['(echo $git_branch)']'
  end

  if [ $exit_code = 0 ]
    set_color yellow
  else
    set_color magenta
  end

  echo -n (whoami)'@'(hostname | tr '.' ' ' | awk '{ print $1; }')
  set_color normal
  echo ' % '
end
