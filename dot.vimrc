set nocompatible

"Vimのpluginの管理(vundle)
"
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 "ここからプラグインを書く
Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'molokai'

 "プラグインの記述はここまで
filetype plugin indent on "vundleの設定end

set encoding=utf-8
"文字コードの判定優先順位
set fileencodings=utf-8,sjis,iso-2022-jp
"改行コードの判定優先順位
set fileformats=unix,mac,dos

"アンダーバーの設定
set laststatus=2
set cmdheight=2
set statusline=%f%r%h%w\ \%l\/%L\ \%m
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).'][改行:'.&ff.']'}

"行番号
set number

"ターミナルカラー
syntax on

"クリップボード
set clipboard+=unnamed

" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"ショートカット
noremap <C-j> o<ESC>
noremap ; :
noremap : ;


" unite.vimの設定
noremap <Space>f :VimFiler -split -simple -winwidth=35 -no-quit<CR>
