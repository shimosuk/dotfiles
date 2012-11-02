set nocompatible

"Vimのpluginの管理(vundle)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 "ここからプラグインを書く
Bundle 'gmarik/vundle'

 "プラグインの記述はここまで
filetype plugin indent on "vundleの設定end

set encoding=utf-8
"文字コードの判定優先順位
set fileencodings=iso-2022-jp,sjis,utf-8
"改行コードの判定優先順位
set fileformats=unix,mac,dos

"アンダーバーの設定
set laststatus=2
set cmdheight=2
set statusline=%f\ %l\/%L\ %r
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).'][改行:'.&ff.']'}


"行番号
set number

"ターミナルカラー
syntax on
colorscheme delek
"クリップボード
set clipboard+=unnamed

"ショートカット
noremap <CR> o<ESC>
