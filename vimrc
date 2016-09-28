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
NeoBundle 'slim-template/vim-slim.git'

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
NeoBundle 'tpope/vim-endwise'
let g:endwise_no_mappings=1

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
" badwolf カラースキーム
NeoBundle 'sjl/badwolf'

if has('vim_starting')
  call neobundle#end()
endif

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

" neosnippet Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" colorscheme setting
set t_Co=256
colorscheme wombat

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


" quickrun setting
let g:quickrun_no_default_key_mappings = 1
nnoremap <C-q><C-r> <Plug>(quickrun)
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
      \       "runner/vimproc/updatetime" : 10,
      \       "outputter/buffer/close_on_empty" : 1,
      \ }

" vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1 " Vim 起動時 vim-indent-guides を自動起動
" let g:indent_guides_start_level = 2           " ガイドをスタートするインデントの量
" let g:indent_guides_auto_colors = 0           " 自動カラー無効
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black     " 奇数番目のインデントの色
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray  " 偶数番目のインデントの色
" let g:indent_guides_guide_size = 1            " ガイドの幅

" rubocop
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" matchit
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ


