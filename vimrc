syntax on
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/vimproc'      " 非同期実行
NeoBundle 'Shougo/vimshell'     " vimからshell起動
NeoBundle 'scrooloose/nerdtree' " Nerdtree
" NeoBundle 'Shougo/unite.vim'   " ファイラ兼ランチャ
NeoBundle 'tpope/vim-pathogen'  " 
NeoBundle 'Shougo/neocomplcache'  " 入力候補表示
NeoBundle 'scrooloose/syntastic'  " 自動文法チェック
NeoBundle 'Shougo/neosnippet'     " スニペットプラグイン
NeoBundle 'errormarker.vim'       " 
NeoBundle 'tomtom/tcomment_vim'   " 
NeoBundle 'ZenCoding.vim'         " 
NeoBundle 'kana/vim-textobj-user' " 
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'

NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

NeoBundleCheck

set number
set title
set showmatch
set tabstop=2
set smartindent
set ignorecase
set smartcase
set wrapscan

" from kytiken
set smarttab
set expandtab
set shiftwidth=2
set shiftround
set nowrap
set showcmd
set autoindent
set smartindent
set hlsearch

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : '.
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

let g:neocomplcache_enable_at_startup = 1

" NERDTreeで隠しファイルをデフォルトで表示
let NERDTreeShowHidden = 1
" デフォルトでNERTree起動
" autocmd VimEnter * execute 'NERDTree'

filetype plugin indent on

set list
set listchars=tab:>-,trail:-,eol:<,extends:≫,precedes:≪,nbsp:%
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

:no <C-E> :NERDTree
:no <C-u> :Unite

