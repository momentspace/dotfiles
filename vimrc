syntax on
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/vimproc' , { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
NeoBundle 'Shougo/vimshell'     " vimからshell起動
NeoBundle 'scrooloose/nerdtree' " Nerdtree
NeoBundle 'Shougo/unite.vim'    " ファイラ兼ランチャ
NeoBundle 'tpope/vim-fugitive'   " git client
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
NeoBundle 'tpope/vim-rails'

NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

NeoBundle 'vim-scripts/VimIRC.vim'
NeoBundle 'mattn/emmet-vim'

" PHP Documentor
NeoBundle 'tobyS/vmustache'
NeoBundle 'tobyS/pdv'
NeoBundle 'sirver/ultisnips'

" colorscheme
NeoBundle 'ujihisa/unite-colorscheme'
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
" hybird カラースキーム
NeoBundle 'w0ng/vim-hybrid'

NeoBundleCheck

set number
set title
set showmatch
set tabstop=2
set smartindent
set ignorecase
set smartcase
set wrapscan
set enc=utf-8

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

" colorscheme setting
colorscheme hybrid

" NERDTreeで隠しファイルをデフォルトで表示
let NERDTreeShowHidden = 1
" デフォルトでNERTree起動
" autocmd VimEnter * execute 'NERDTree'

filetype plugin indent on

set list
set listchars=tab:>-,trail:-,eol:<,nbsp:%
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

" :no <C-E> :NERDTree
" :no <C-u> :Unite

"====================
" START NerdTree 設定
"====================
" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
  "b:nerdstatus = 1 : NERDTree 表示中
  "b:nerdstatus = 2 : NERDTree 非表示中

  if !exists('g:nerdstatus')
    execute 'NERDTree ./'
    let g:windowWidth = winwidth(winnr())
    let g:nerdtreebuf = bufnr('')
    let g:nerdstatus = 1 

  elseif g:nerdstatus == 1 
    execute 'wincmd t'
    execute 'vertical resize' 0 
    execute 'wincmd p'
    let g:nerdstatus = 2 
  elseif g:nerdstatus == 2 
    execute 'wincmd t'
    execute 'vertical resize' g:windowWidth
    let g:nerdstatus = 1 
  endif
endfunction

noremap <C-q><C-q> :NERDTreeToggle<cr>
noremap <C-q><C-r> :Unite file_mru<cr>
noremap <C-r><C-r> :NERDTreeFind<cr>
"====================
"END NerdTree 設定
"====================


" emmet-vim設定
let g:user_emmet_leader_key='<c-q>'


" php documentor setting
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

