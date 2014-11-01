set nocompatible
scriptencoding cp932


"----------------------------------------
" システム設定
"----------------------------------------

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup
"バックアップ/スワップファイルを作成する/しない
set nobackup

" Persistent undo
if version >= 703
  set undofile
  set undodir=~/.vim/undo
endif

"クリップボードを共有
set clipboard+=unnamed

"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal

"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500

"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden

"ヒストリの保存数
set history=50

"日本語の行の連結時には空白を入力しない
set formatoptions+=mM

"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,h,l,[,],<,>

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"コマンドライン補完するときに強化されたものを使う
set wildmenu

"pluginを使用可能にする
filetype plugin indent on


"----------------------------------------
" 検索
"----------------------------------------

"検索の時に大文字小文字を区別しない
set ignorecase

"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set smartcase

"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

"インクリメンタルサーチ
set incsearch

"検索文字の強調表示
set hlsearch

"w,bの移動で認識する文字
set iskeyword=@,48-57,_,192-255


"----------------------------------------
" 表示設定
"----------------------------------------

" スプラッシュを表示しない
set shortmess+=I

" エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=

" マクロ実行中などの画面再描画を行わない
set lazyredraw

" 行番号表示
set number

" 括弧の対応表示時間
set showmatch matchtime=1

" 自動的にインデントする
set cindent

" Cインデントの設定
set cinoptions+=:0

" タイトルを表示
set title

"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=1
set laststatus=2

"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline

" Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

" Solarized 設定
set t_Co=256
set background=dark
if !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif

""""""""""""""""""""""""""""""
"ステータスラインに文字コードやBOM、16進表示等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\
endif

function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
" diffの設定
if has('win95') || has('win16') || has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    silent! let saved_sxq=&shellxquote
    silent! set shellxquote=
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    " let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    let cmd = '!""' . $VIM . '\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
    silent exe cmd
    silent! let &shellxquote = saved_sxq
  endfunction
endif
"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction


" Stylus file detection
" autocmd BufNewFile,BufReadPost *.coffee set filetype=coffee

" Stylus file detection
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
autocmd BufNewFile,BufReadPost *.stylus set filetype=stylus


"----------------------------------------
" ノーマルモード
"----------------------------------------

" reload .vimrc
nnoremap <silent><F8> :source ~/.vimrc<CR>
"強制全保存終了を無効化
nnoremap ZZ <Nop>
nnoremap <C-z> <Nop>
"カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
"キーボードマクロには物理行移動を推奨
"h l はノーマルモードのみ行末、行頭を超えることが可能に設定(whichwrap)
" zvはカーソル位置の折り畳みを開くコマンド
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv

nnoremap <silent><C-a> <Home>
nnoremap <silent><C-e> <End>
nnoremap <silent><C-b> <Left>
nnoremap <silent><C-f> <Right>
nnoremap <silent><C-n> <Down>
nnoremap <silent><C-p> <Up>
nnoremap <silent><C-k> d$

"----------------------------------------
" 挿入モード
"----------------------------------------
"""-----------------------------
""  insert_modeでのカーソル操作
""------------------------------
""移動
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
"inoremap <C-n> <Down>
inoremap <C-p> <UP>
inoremap <C-k> <Esc>d$A
""消去
inoremap <C-h> <BS>
inoremap <C-d> <delete>

"----------------------------------------
" ビジュアルモード
"----------------------------------------
vnoremap j gj
vnoremap k gk

"----------------------------------------
" コマンドモード
"----------------------------------------
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-c>:

"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    redraw
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


"----------------------------------------
" 各種プラグイン設定
"----------------------------------------
autocmd FileType php,ctp :set dictionary=~/vim/dict/php.dict
autocmd FileType php set makeprg=php\ -l\ %

function! s:WithoutBundles()
  colorscheme desert
endfunction

function! s:LoadBundles()
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimfiler.vim'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'StanAngeloff/php.vim'
  NeoBundle 'Shougo/neosnippet.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
  endif
  NeoBundle 'othree/html5.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'wavded/vim-stylus'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'digitaltoad/vim-jade'
  NeoBundle 'shawncplus/phpcomplete.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'alpaca-tc/alpaca_tags'
  NeoBundle 'AndrewRadev/switch.vim'
  NeoBundle 'vim-scripts/ruby-matchit'
endfunction

function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#begin(expand('~/.vim/bundle/'))
      NeoBundleFetch 'Shougo/neobundle.vim'
      call neobundle#end()
      call s:LoadBundles()
    catch
      call s:WithoutBundles()
    endtry
  else
    call s:WithoutBundles()
  endif
  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()


"----------------------------------------
"NeoComplete設定
"----------------------------------------

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 10
let g:neocomplete#enable_ignore_case = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,php setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'php' : $HOME . '.vim/dict/php.dict',
    \ 'ruby' : $HOME . '.vim/dict/ruby.dict'
\ }

"----------------------------------------
"Unite設定
"----------------------------------------
nnoremap [unite] <Nop>
nmap     <Space>u [unite]
" 開いていない場合はカレントディレクトリ
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
nnoremap -sf :<C-u>VimFilerCurrentDir -split<CR>
nnoremap ;e :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>


"----------------------------------------
" PHP 設定
"----------------------------------------

autocmd BufRead */dev/new-attendance/* setl noexpandtab


"----------------------------------------
"その他設定
"----------------------------------------

" Reload all buffers
nnoremap <silent>;r :bufdo e<CR>

" Enable syntax highlighting
nnoremap <silent>;s :syntax on<CR>

" disable q:, q/, q?
:nnoremap q: :
:nnoremap q/ <Nop>
:nnoremap q? <Nop>

set backspace=indent,eol,start
set scrolloff=40
set sidescrolloff=16
set sidescroll=1

" Plugin key-mappings.  " <C-k>でsnippetの展開
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

let g:vimfiler_as_default_explorer = 1

" colorscheme solarized
colorscheme molokai

let g:tmux = system("which tmux > /dev/null 2>&1 && echo 'tmux found'")

if g:tmux != ''
  autocmd VimEnter,BufReadPost,FileReadPost,BufNewFile,BufEnter,InsertEnter * call s:tmux_rename_window()
  autocmd VimLeave * call system("tmux rename-window zsh:$PWD:t")
  autocmd VimLeave * call system("tmux set-window-option -g window-status-current-format '[#I #W]'")
  autocmd VimLeave * call system("tmux set-window-option -g window-status-format '[#I #W]'")

  function! s:tmux_rename_window()
    if (expand("%:t")) == ''
      call system ('tmux rename-window vim')
    else
      call system("tmux rename-window vim:" . expand("%:t"))
    endif
  endfunction
endif

nnoremap <silent>- :Switch<CR>

" syntastic rubocop
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
au FileType ruby if exists('b:rails_root') |
  \ let b:syntastic_ruby_rubocop_options = '--rails' | endif


nnoremap <silent><C-w><C-h> <C-w>h
nnoremap <silent><C-w><C-j> <C-w>j
nnoremap <silent><C-w><C-k> <C-w>k
nnoremap <silent><C-w><C-l> <C-w>l

nnoremap <silent><C-w>h :new<CR>
nnoremap <silent><C-w>v :vnew<CR><C-w>x<C-w>l

" yank all lines
nnoremap <silent>ya :%y+<CR>

nnoremap <silent>;n :noh<CR>

nnoremap <silent><C-i> bi
" nnoremap <silent><C-a> ea

if !has('gui_running')
  set notimeout
  set ttimeout
  set timeoutlen=100
endif

