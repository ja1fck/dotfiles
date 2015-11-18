set number
syntax on
set cursorline
set backspace=indent,eol,start

"change cursor width in Insert mode
set guicursor+=i:blinkwait10

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期化 
" NeoBundleを更新するための設定
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'


" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
set laststatus=2
set t_Co=256	"and Input 'TERM=xterm-256color' on shell
"NeoBundle 'nosami/OmniSharp', {
"¥ 'autoloaded': {'filetypes': ['cs', 'csi', 'csx']},
"¥ 'build': {
"¥   'windows' : 'msbuild server/OmniSharp.sln', 
"¥   'mac': 'xbuild server/OmniSharp.sln',
"¥ }
"¥}

"NeoBundle 'tpope/vim-dispach'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1

"Install colorscheme
NeoBundle 'nanotech/jellybeans.vim'

NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0 "Needles to ask whetehr .yum_extra_conf file is loaded or not.

"NeoBundleLazy "davidhalter/jedi-vim", {
"      \ "autoload": {
"      \   "filetypes": ["python", "python3", "djangohtml"],
"      \ },
"      \ "build": {
"      \   "mac": "pip install jedi",
"      \   "unix": "pip install jedi",
"      \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  "補完データの表示方法を設定.default(0)だと補完候補がtextに紛れる。
  let g:jedi#show_call_signatures = 2
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
  let g:jedi#goto_command = '<Leader>G'
endfunction

call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck
