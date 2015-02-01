NeoBundleLazy 'Shougo/unite.vim', {
      \   'autoload': {'commands': ['Unite']}
      \ }
NeoBundleLazy 'Shougo/neomru.vim', {
      \   'autoload': {'commands': ['Unite']}
      \ }
NeoBundleLazy 'Shougo/unite-outline', {
      \   'autoload': {'commands': ['Unite']}
      \ }

nnoremap [unite] <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]f :<C-u>VimFilerBufferDir<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]h :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]o : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>

function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  map <C-a> <Home>
  imap <C-e> <End>
  map <C-b> <Left>
  map <C-f> <Right>
  map <C-n> <Down>
  map <C-p> <UP>
  map <C-h> <BS>
  map <C-d> <Delete>
  nnoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

let g:unite_source_history_yank_enable=1
