if !&compatible
  set nocompatible
endif
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" dein settings {{{
" dein���̂̎����C���X�g�[��
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" �v���O�C���ǂݍ��݁��L���b�V���쐬
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" �s���v���O�C���̎����C���X�g�[��
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" �v���O�C���ȊO�̂��̑��ݒ肪����
filetype plugin indent on
syntax enable
inoremap jj <ESC>
nnoremap Y y$
onoremap j iw
onoremap h i(
onoremap k i"
onoremap l i'

"Windows�ŊJ���Ƃ��ő剻����
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
"�N�����̃��b�Z�[�W��\�������Ȃ�
set shortmess+=I
"����
set imsearch=1
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
"�C���f���g�̐ݒ�
set shiftwidth=4
set softtabstop=4
set expandtab
set virtualedit=block
"������ɉ�ʒ����ɂ���
nnoremap n nzz
nnoremap N Nzz
nnoremap * *N
nnoremap # #N
nnoremap g* g*zz
"ESC�Q�񉟂��Ńn�C���C�g����
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
"tab�Ԃ̈ړ����u���E�U�Ɠ����ɂ���
nnoremap <S-Tab> gt

"�ʏ�̃L�[�}�b�v�͂߂�ǂ������̂ł܂Ƃ߂�
nnoremap <C-s> :w<CR>
nnoremap <C-s><C-s> :wq
nnoremap qq :q!<CR>
nnoremap <C-c> ciw
nnoremap <C-h> :vert bo help<Space>
nnoremap + <C-a>
nnoremap - <C-x>
"�t�@�C�����폜����
nnoremap <S-DEL> :call delete(expand('%:p')) \|bdelete!
"�t�@�C����ʖ��ŕۑ�����
nnoremap <F12> :saveas<SPACE>
"�t�@�C�������R�s�[����
nnoremap <leader><Bslash> :<C-u>echo "copied filename: " . expand('%:t') \| let @+=expand('%:t')\| let @"=expand('%:t')<CR>
"�t�@�C�������t���p�X�ŃR�s�[����
nnoremap <C-Bslash> :<C-u>echo "copied fullpath: " . expand('%:p') \| let @+=expand('%:p')\| let @"=expand('%:p')<CR>
nnoremap <C-g><C-g> :vimgrep // C:\work\CVSPayment\SVN\**\*
"�ړ��R�}���h���J�X�^�}�C�Y
nnoremap H 0
nnoremap J 37jz<CR>
nnoremap K 37kz<CR>
nnoremap L $
nnoremap <C-q> g;
nnoremap R yyp
"�����ԈႦ��̂Ŗ��������Ƃ�
nnoremap Q <NOP>
nnoremap P o<C-r>0<ESC>
nnoremap <C-u> g~iw
"windows���ۂ�
nnoremap <C-a> ggVG
vnoremap <C-c> y
nnoremap <C-n> :tabnew<CR>i
vnoremap v $h
" �s���ړ�
nnoremap <C-k> "zdd<Up>"zP
nnoremap <C-j> "zdd"zp
" �����s���ړ�
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]
"�r�W���A�����[�h���ɘA�����ē\��t���\�ɂ���
vnoremap p "0p<CR>

"�T�N���G�f�B�^���ۂ����������
"�\�[�g���ă}�[�W����
vnoremap <A-a> :sort<CR>
vnoremap <A-d> :sort!<CR>
vnoremap <A-m> :sort u<CR>
vnoremap <C-F6> gu
vnoremap <C-F7> gU
nnoremap <C-F6> guiw
nnoremap <C-F7> gUiw
nnoremap <A-x> :set wrap!<CR>
nnoremap <A-;> :<ESC>a<C-r>=strftime("%Y-%m-%d %H:%M:%S ==========")<CR><ESC>
nnoremap <A-:> :<ESC>a<C-r>=strftime("%H��%M��")<CR><ESC>
"�g�p�p�x���l���ċ�`�I���ƃr�W���A�����[�h���f�t�H���g���甽�΂ɂ���
nnoremap v <C-v>
nnoremap <C-v> v
"�����N�֎~
nnoremap x "_x
"s�ŕҏWS�Ń����[�h
nnoremap <leader>s :tabe $MYVIMRC<CR>
nnoremap <leader>1  :<C-u>source $MYVIMRC<CR>:Scouter<CR>
inoremap <silent> ���� <ESC>
nnoremap <leader><C-k> :<UP>
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
"�m�[�}�����[�h�ŉ��s�������悤�ɂ���
nnoremap <CR> A<CR><ESC>
nnoremap <S-CR> kA<CR><ESC>j
" ESC��IME���m����OFF
set iminsert=0
inoremap <ESC> <ESC>:set iminsert=0<CR>
inoremap <C-z> <ESC>u:set iminsert=0<CR>
nnoremap <C-z> <Nop>

"�o�b�t�@�Ԃ̈ړ�
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader>e :ls<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"�s���܂�Ԃ��Ă���ꍇ�������ڂǂ���Ɉړ�����
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
" Vimscript file settings�@---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim :inoreabbrev <buffer> augroupp augroup foo<CR>autocmd!<CR>augroup END<ESC>k>>k0tf
    autocmd FileType python :nnoremap <f5> :w<CR>:!python %<CR>
    autocmd FileType vb :nnoremap <f5> :! %<CR>
augroup END
" }}}
