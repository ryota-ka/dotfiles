if dein#tap('ale')
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_format = '[%severity%] [%linter%] %s'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_keep_list_window_open = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_open_list = 1
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_statusline_format = ['E%d', 'W%d', '']
end
