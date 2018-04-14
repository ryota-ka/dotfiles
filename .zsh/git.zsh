local diff_highlight_dir=/usr/local/share/git-core/contrib/diff-highlight

if [ -d $diff_highlight_dir ]; then
  export PATH=$PATH:$diff_highlight_dir
fi
