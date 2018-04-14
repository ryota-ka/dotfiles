function! HasPlugin(name)
  return has_key(g:plugs, a:name) ? v:true : v:false
endfunction
