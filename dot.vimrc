set nocompatible

"Vimのpluginの管理(vundle)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 "ここからプラグインを書く
Bundle 'gmarik/vundle'

 "プラグインの記述はここまで
filetype plugin indent on "vundleの設定end

"通常の設定ファイル
set number
set cmdheight=2
:syntax on
:colorscheme koehler
set clipboard+=unnamed

:set statusline=%F%m%r%h%w\ [%04l,%04v][%p%%]\ [%L]
:set laststatus=2 
