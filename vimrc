" インストールディレクトリの指定
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_file = expand('~/.vim/dein') . '/plugins.toml'
let s:toml_dir = expand('~/.vim/dein/plugins')

" dein.vim ディレクトリがruntimepathに入っていない場合、追加
if match( &runtimepath, '/dein.vim' ) == -1
  " dein_repo_dir で指定した場所に dein.vim が無い場合、git cloneしてくる
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein の設定
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " 各プラグインのtomlを読み込む
  call dein#load_toml( s:toml_file, {} )
  
  call dein#end()
  call dein#save_state()
endif

" 各プラグインのインストールチェック（なかったら自動的に追加される）
if dein#check_install()
  call dein#install()
endif
