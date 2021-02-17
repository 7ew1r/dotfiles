set number
set cursorline
set cursorcolumn
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set clipboard+=unnamedplus
colorscheme hybrid
inoremap <silent> jj <ESC>


set mouse=a

"status line----
"" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  "call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  let g:rc_dir = expand('~/.config/nvim')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml     , {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
