setlocal wrap

function! s:markdown_outline() abort
  let fname = @%
  let current_win_id = win_getid()

  " # heading
  execute 'vimgrep /^#\{1,6} .*$/j' fname

  " heading
  " ===
  execute 'vimgrepadd /\zs\S\+\ze\n[=-]\+$/j' fname

  let loclist = getloclist(0)
  if len(loclist) == 0
    cclose
    return
  endif

  " make sure to focus original window because synID works only in current window
  call win_gotoid(current_win_id)
  call filter(loclist,
        \ 'synIDattr(synID(v:val.lnum, v:val.col, 1), "name") != "markdownCodeBlock"'
        \ )
  call sort(loclist, {a,b -> a.lnum - b.lnum})
  call setloclist(loclist)
  call setloclist([], 'r', {'title': fname .. ' TOC'})
  copen
endfunction

nnoremap <buffer> gO <Cmd>call <sid>markdown_outline()<CR>
