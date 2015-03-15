set nocompatible

"Vimのpluginの管理(neobundle)
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gmarik/vundle'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'molokai'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rcmdnk/vim-markdown'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"プラグインの記述はここまで

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
"検索結果ハイライト
set hlsearch

"ターミナルカラー
syntax on

"クリップボード
set clipboard+=unnamed

" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" ノーマルモード
noremap <C-j> o<ESC>
noremap <C-l> <ESC>
noremap ; :
noremap : ;
noremap <Esc><Esc> :nohlsearch<CR><Esc>

" インサートモード
inoremap <buffer> { {}<LEFT>
inoremap <buffer> ( ()<LEFT>
inoremap <buffer> [ []<LEFT>
inoremap <buffer> < <><LEFT>
inoremap <buffer> " ""<LEFT>
inoremap <buffer> ' ''<LEFT>
inoremap <C-l> <ESC>

" ビジュアルモード
vnoremap { "zdi<C-V>{<C-R>z}<ESC>
vnoremap [ "zdi<C-V>[<C-R>z]<ESC>
vnoremap ( "zdi<C-V>(<C-R>z)<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" unite.vimの設定
noremap <Space>f :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" vimgrepの設定
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>

colorscheme molokai
" vim-indent-guides の設定
let g:indent_guides_enable_on_vim_startup=1 " 自動的にvim-indent-guidesをオン
let g:indent_guides_start_level=2           " スタート位置
let g:indent_guides_guide_size = 1          " 幅
let g:indent_guides_auto_colors=0           " カラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

set list
set listchars=tab:>-,extends:<,trail:-,eol:<
highlight NonText term=underline ctermfg=black guifg=darkgray
highlight SpecialKey term=underline ctermfg=red guifg=darkgray
