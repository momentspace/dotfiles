syntax on
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
endif

" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \ 'windows' : 'make -f make_mingw32.mak',
  \ 'cygwin' : 'make -f make_cygwin.mak',
  \ 'mac' : 'make -f make_mac.mak',
  \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/vimshell'     " vimからshell起動
NeoBundle 'scrooloose/nerdtree' " Nerdtree
NeoBundle 'Shougo/unite.vim'    " ファイラ兼ランチャ
NeoBundle 'Shougo/neomru.vim'   " file_mru
NeoBundle 'tpope/vim-fugitive'   " git client
NeoBundle 'tpope/vim-pathogen'  " 
NeoBundle 'Shougo/neocomplcache'  " 入力候補表示
NeoBundle 'scrooloose/syntastic'  " 自動文法チェック
NeoBundle 'Shougo/neosnippet'     " スニペットプラグイン
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'errormarker.vim'       " 
NeoBundle 'tomtom/tcomment_vim'   " 
NeoBundle 'ZenCoding.vim'         " 
NeoBundle 'kana/vim-textobj-user' " 
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'
NeoBundle 'tpope/vim-rails'
NeoBundle 'OmniSharp/omnisharp-vim'

NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

" NeoBundle 'vim-scripts/VimIRC.vim'
" NeoBundle 'mattn/emmet-vim'

NeoBundle 'xsbeats/vim-blade'     " Blade templates highlight
<<<<<<< HEAD
NeoBundle 'slim-template/vim-slim'

" PHP Documentor
" NeoBundle 'tobyS/vmustache'
" NeoBundle 'tobyS/pdv'
" NeoBundle 'sirver/ultisnips'

NeoBundle 'thinca/vim-quickrun'             " quickrun
" NeoBundle 'nathanaelkane/vim-indent-guides' " indent-guides

" PowerLine
" NeoBundle 'alpaca-tc/alpaca_powertabline'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" NeoBundle 'Lokaltog/powerline-fontpatcher'

" css/sass/compass
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'

" Ruby
NeoBundle 'pocke/dicts'
NeoBundle 'vim-ruby/vim-ruby'

" coffee script color syntax
NeoBundle 'kchmck/vim-coffee-script'

" less syntax
NeoBundle 'groenewege/vim-less'

" jsx syntax highlight and indenting
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

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

if has('vim_starting')
  call neobundle#end()
endif

NeoBundleCheck

" colorscheme setting
colorscheme jellybeans

set number
set title
set showmatch
set tabstop=2
set smartindent
set ignorecase
set smartcase
set wrapscan
set enc=utf-8

" teraterm設定
set term=builtin_linux
set ttytype=builtin_linux
set t_Co=256

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
colorscheme desert
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
" nnoremap <C-q><C-f> :Unite file_mru<cr>
nnoremap <C-q><C-f> :NERDTreeFind<cr>
"====================
"END NerdTree 設定
"====================


" emmet-vim設定
let g:user_emmet_leader_key='<c-q>'


" php documentor setting
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" jsx setting
let g:jsx_ext_required = 0

" rubocop
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']


