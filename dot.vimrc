set nocompatible

"Vimのpluginの管理(vundle)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 "ここからプラグインを書く
Bundle 'gmarik/vundle'

 "プラグインの記述はここまで
filetype plugin indent on "vundleの設定end

"行番号
set number
"ターミナルカラー
syntax on
colorscheme delek
"クリップボード
set clipboard+=unnamed
"アンダーバーの設定
set statusline=%F%m%r%h%w\ [%04l,%04v][%p%%]\ [%L]
set laststatus=2
set cmdheight=2
