let s:tmux = system("which tmux > /dev/null 2>&1 && echo 'tmux found'")

if s:tmux != ''
  augroup tmux
    autocmd!
    autocmd VimEnter,BufReadPost,FileReadPost,BufNewFile,BufEnter,InsertEnter * call s:tmux_rename_window()
    autocmd VimLeave * call system("tmux rename-window zsh:$PWD:t")
    autocmd VimLeave * call system("tmux set-window-option -g window-status-current-format '[#I #W]'")
    autocmd VimLeave * call system("tmux set-window-option -g window-status-format '[#I #W]'")
  augroup END

  function! s:tmux_rename_window()
    let s:filename = expand("%:t")
    if s:filename == ''
      call system('tmux rename-window vim')
    else
      call system('tmux rename-window vim\:' . s:filename)
    endif
  endfunction
endif
