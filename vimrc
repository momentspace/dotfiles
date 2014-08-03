syntax on
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'errormarker.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ZenCoding.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'

NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

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

filetype plugin indent on

set list
set listchars=tab:>-,trail:-,eol:<,extends:≫,precedes:≪,nbsp:%
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

:no <C-E> :Explor
:no <C-u> :Unite

