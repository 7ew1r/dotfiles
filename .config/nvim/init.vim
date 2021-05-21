set number
set termguicolors
set cursorline
set cursorcolumn
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set clipboard+=unnamedplus
colorscheme hybrid
inoremap <silent> jj <ESC>

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

" タブではなくスペースを使用
" https://yu8mada.com/2018/08/26/i-ll-explain-vim-s-5-tab-and-space-related-somewhat-complicated-options-as-simply-as-possible/
set tabstop=4
set shiftwidth=4
set expandtab

set mouse=a

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

"-------------------------------------------------------------------------------
" DevIcons
"-------------------------------------------------------------------------------

"set guifont=Sauce\ Code\ Pro\ Light\ Nerd\ Font\ Complete\ Windows\ Compatible:h11
set guifont=Hack\ Nerd\ Font\ Mono\ Compatible:h11
let g:webdevicons_enable_vimfiler = 1

" Providers
let g:python_host_prog = $HOME . '/.anyenv/envs/pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.anyenv/envs/pyenv/versions/neovim3/bin/python'
let g:ruby_host_prog = $HOME . '/.anyenv/envs/rbenv/versions/2.6.6/bin/neovim-ruby-host'
