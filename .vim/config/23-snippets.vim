NeoBundleLazy 'Shougo/neosnippet.vim', {
            \     'autoload': {'insert': 1}
            \   }
NeoBundleLazy 'Shougo/neosnippet-snippets', {
            \     'autoload': {'insert': 1}
            \  }

let s:bundle = neobundle#get("neosnippet.vim")
function! s:bundle.hooks.on_source(bundle)
  imap <C-,> <Plug>(neosnippet_expand_or_jump)
  smap <C-,> <Plug>(neosnippet_expand_or_jump)
  xmap <C-,> <Plug>(neosnippet_expand_target)

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" :
        \ pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" :
        \ "\<TAB>"

  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endfunction
unlet s:bundle
