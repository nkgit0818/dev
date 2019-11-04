if !&compatible
  set nocompatible
endif
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く
filetype plugin indent on
syntax enable
inoremap jj <ESC>
nnoremap Y y$
onoremap j iw
onoremap h i(
onoremap k i"
onoremap l i'

"Windowsで開くとき最大化する
augroup windowSettingForGUI
    autocmd!
    autocmd GUIEnter * simalt ~x
augroup END

colorscheme atom-dark

let mapleader=' '
nnoremap <leader>" viw<ESC>a"<ESC>bi"<ESC>lel
nnoremap <leader>' viw<ESC>a'<ESC>bi'<ESC>lel
vnoremap <leader>" <ESC>`>a"<ESC>`<i"<ESC>
vnoremap <leader>' <ESC>`>a'<ESC>`<i'<ESC>
"replacing the highlighted words with the word under cursor
nnoremap <C-x> :%s//<C-r><C-w>/g
set fileencodings=utf-8,cp932,sjis,euc-jp
set autochdir
set number
set cursorline
set wildmenu
set history=200
set smartindent
set title
set backspace=indent,eol,start
"set clipboard=unnamed,unnamedplus,autoselect,autoselectplus
set clipboard=unnamedplus
set selectmode+=mouse
set whichwrap=b,s,h,l,<,>,[,]
set noswapfile
set autoread
set hidden
set splitright
set splitbelow
set ttyfast
"起動時のメッセージを表示させない
set shortmess+=I
"検索
set imsearch=1
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
"インデントの設定
set shiftwidth=4
set softtabstop=4
set expandtab
set virtualedit=block
"検索後に画面中央にする
nnoremap n nzz
nnoremap N Nzz
nnoremap * *N
nnoremap # #N
nnoremap g* g*zz
"ESC２回押しでハイライト消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
"tab間の移動をブラウザと同じにする
nnoremap <S-Tab> gt

"通常のキーマップはめんどくさいのでまとめる
nnoremap <C-s> :w<CR>
nnoremap <C-s><C-s> :wq
nnoremap qq :q!<CR>
nnoremap <C-c> ciw
nnoremap <C-h> :vert bo help<Space>
nnoremap + <C-a>
nnoremap - <C-x>
"ファイルを削除する
nnoremap <S-DEL> :call delete(expand('%:p')) \|bdelete!
"ファイルを別名で保存する
nnoremap <F12> :saveas<SPACE>
"ファイル名をコピーする
nnoremap <leader><Bslash> :<C-u>echo "copied filename: " . expand('%:t') \| let @+=expand('%:t')\| let @"=expand('%:t')<CR>
"ファイル名をフルパスでコピーする
nnoremap <C-Bslash> :<C-u>echo "copied fullpath: " . expand('%:p') \| let @+=expand('%:p')\| let @"=expand('%:p')<CR>
nnoremap <C-g><C-g> :vimgrep // C:\work\CVSPayment\SVN\**\*
"移動コマンドをカスタマイズ
nnoremap H 0
nnoremap J 37jz<CR>
nnoremap K 37kz<CR>
nnoremap L $
nnoremap <C-q> g;
nnoremap R yyp
"押し間違えるので無効化しとく
nnoremap Q <NOP>
nnoremap P o<C-r>0<ESC>
nnoremap <C-u> g~iw
"windowsっぽく
nnoremap <C-a> ggVG
vnoremap <C-c> y
nnoremap <C-n> :tabnew<CR>i
vnoremap v $h
" 行を移動
nnoremap <C-k> "zdd<Up>"zP
nnoremap <C-j> "zdd"zp
" 複数行を移動
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]
"ビジュアルモード時に連続して貼り付け可能にする
vnoremap p "0p<CR>

"サクラエディタっぽい動作を実現
"ソートしてマージする
vnoremap <A-a> :sort<CR>
vnoremap <A-d> :sort!<CR>
vnoremap <A-m> :sort u<CR>
vnoremap <C-F6> gu
vnoremap <C-F7> gU
nnoremap <C-F6> guiw
nnoremap <C-F7> gUiw
nnoremap <A-x> :set wrap!<CR>
nnoremap <A-;> :<ESC>a<C-r>=strftime("%Y-%m-%d %H:%M:%S ==========")<CR><ESC>
nnoremap <A-:> :<ESC>a<C-r>=strftime("%H時%M分")<CR><ESC>
"使用頻度を考えて矩形選択とビジュアルモードをデフォルトから反対にする
nnoremap v <C-v>
nnoremap <C-v> v
"ヤンク禁止
nnoremap x "_x
"sで編集Sでリロード
nnoremap <leader>s :tabe $MYVIMRC<CR>
nnoremap <leader>1  :<C-u>source $MYVIMRC<CR>:Scouter<CR>
inoremap <silent> っｊ <ESC>
nnoremap <leader><C-k> :<UP>
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
"ノーマルモードで改行をいれるようにする
nnoremap <CR> A<CR><ESC>
nnoremap <S-CR> kA<CR><ESC>j
" ESCでIMEを確実にOFF
set iminsert=0
inoremap <ESC> <ESC>:set iminsert=0<CR>
inoremap <C-z> <ESC>u:set iminsert=0<CR>
nnoremap <C-z> <Nop>

"バッファ間の移動
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader>e :ls<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"行が折り返している場合も見た目どおりに移動する
nnoremap  k gk
nnoremap  gk k
nnoremap  j gj
nnoremap  gj j
vnoremap <leader> VV
inoremap <C-v> <C-r>0
nnoremap <leader>l :set list!<CR>
" Scuter---------------------- {{{
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  if len(filter(lines,'v:val !~ pat')) >= 1
      return len(filter(lines,'v:val !~ pat'))
  endif
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
" }}}
" Vimscript file settings　---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim :inoreabbrev <buffer> augroupp augroup foo<CR>autocmd!<CR>augroup END<ESC>k>>k0tf
    autocmd FileType python :nnoremap <f5> :w<CR>:!python %<CR>
    autocmd FileType vb :nnoremap <f5> :! %<CR>
augroup END
" }}}
