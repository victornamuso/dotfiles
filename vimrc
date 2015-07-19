		set nocompatible


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'

call vundle#end()            
filetype plugin indent on

"general vim settings
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set number
let mapleader = ","
set clipboard=unnamed
set timeoutlen=20
set regexpengine=1
syntax enable
filetype  indent on
filetype plugin on
set shiftwidth=4
set tabstop=2
set incsearch                          " Do incremental searching
set noswapfile 
set noerrorbells                       " Don't beep
set nowrap 
set visualbell 

let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> :w<CR>
vmap <c-s> <esc>:w<CR>gv

map <C-b> :CtrlPBuffer<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-c> <esc>
set backspace=2 "make backspace work like most other apps

let g:user_emmet_leader_key='hh'
let g:mustache_abbreviations = 1
if has("autocmd")
		au BufNewFile,BufRead *.{mustache,handlebars,hbs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif
nnoremap <S-Right> :vertical resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-K> :resize +1<CR>
nnoremap <S-J> :resize -1<CR>
