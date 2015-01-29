if has('lua') && (v:version > 702 || (v:version == 703 && has('patch885')))
  NeoBundleLazy 'Shougo/neocomplete.vim', {
        \     'autoload': {'insert': 1}
        \  }
  let s:bundle = neobundle#get("neocomplete.vim")
  function! s:bundle.hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 1
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    let g:neocomplete#sources#dictionary#dictionaries = {
          \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
          \ 'scheme' : $HOME.'/.gosh_completions',
          \ 'ruby' : $DOTVIM.'/dict/ruby.dict'
          \ }

    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    inoremap <expr><TAB> pumvisible() ? "\<C-n>\<C-p>" : "\<TAB>"
    inoremap <expr><CR>  pumvisible() ? "\<C-n>\<C-p>" . neocomplete#close_popup() : "\<CR>"
    inoremap <expr><Esc> pumvisible() ? neocomplete#close_popup() : "\<Esc>"
    inoremap <expr><C-l> neocomplete#complete_common_string()
    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
    inoremap <expr><BS>  neocomplete#smart_close_popup() . "\<C-h>"
    inoremap <expr><C-y> neocomplete#close_popup()

    let g:neocomplete#enable_auto_select = 1

    set omnifunc=syntaxcomplete#Complete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType vim setlocal omnifunc=vimcomplete#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  endfunction
  unlet s:bundle
endif
