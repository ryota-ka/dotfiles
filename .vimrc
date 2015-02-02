if &compatible
  set nocompatible
endif

set encoding=utf-8
scriptencoding utf-8

set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,latin1

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

set autoread


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

" エラー時の音とビジュアルベルの抑制
" set noerrorbells
" set novisualbell
" set visualbell t_vb=

" マクロ実行中などの画面再描画を行わない
set lazyredraw

" 行番号表示
set number

" 括弧の対応表示時間
set showmatch matchtime=1

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


set cursorline
set cursorcolumn

" highlight
if &t_Co > 2 || has('gui_running')
  syntax on
endif

""""""""""""""""""""""""""""""
" インデント設定
""""""""""""""""""""""""""""""

" 自動的にインデントする
set cindent

" Cインデントの設定
set cinoptions+=:0

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent


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


"----------------------------------------
"その他設定
"----------------------------------------

" disable q:, q/, q?
 nnoremap q: :
 nnoremap q/ <Nop>
 nnoremap q? <Nop>

set backspace=indent,eol,start
set scrolloff=20
set sidescrolloff=16
set sidescroll=1

let g:vimfiler_as_default_explorer = 1

nnoremap <silent>- :Switch<CR>

runtime! config/*.vim
