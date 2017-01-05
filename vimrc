set nocompatible
"execute pathogen#infect()


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'gregsexton/MatchTag'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'bling/vim-airline'
Plugin 'rizzatti/dash.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'osyo-manga/vim-over'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'

call vundle#end()            


if has ("autocmd")
  filetype indent on
endif



filetype plugin indent on

"general vim settings
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set number
let mapleader = ","
set clipboard=unnamed
" set timeoutlen=300
set timeout timeoutlen=5000 ttimeoutlen=100
set regexpengine=1
set iskeyword+=-

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


syntax enable
filetype  indent on
filetype plugin on
" set tabstop=2 shiftwidth=2 softtabstop=2
set shiftwidth=2
set incsearch                          " Do incremental searching
set noswapfile 
set noerrorbells                       " Don't beep
"set nowrap 
set visualbell 
set cursorline


iabbrev rpry require 'pry'; binding.remote_pry;

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>c :ccl<CR>
nnoremap <Leader>sc :%! slackcat -c 
nnoremap <Leader>rn :set relativenumber<CR>
nnoremap <Leader>n :set number<CR>
" map <Leader>i gg=G``<CR>
map <C-i> mzgg=G``zz
"open other files in the current directory
map <Leader>mm :e %:p:h/
map <Leader>vs :vsp %:p:h/
map <Leader>s :split %:p:h/
map <Leader>ot :tab split<CR>
map <Leader>xt :tabc<CR>
map <Leader>a :Ack<CR>

map <Leader>ec :e %:p:h/controller.js<CR>
map <Leader>emc :e %:p:h/component.js<CR>
map <Leader>er :e %:p:h/route.js<CR>
map <Leader>et :e %:p:h/template.hbs<CR>
map <Leader>es :e %:p:h/service.js<CR>
" map <Leader>vcn :vsp %:p:h/controller.js<CR>
" map <Leader>vcm :vsp %:p:h/component.js<CR>
" map <Leader>vr :vsp %:p:h/route.js<CR>
" map <Leader>vt :vsp %:p:h/template.hbs<CR>
" map <Leader>vs :vsp %:p:h/service.js<CR>
" map <Leader>scn :spl %:p:h/controller.js<CR>
" map <Leader>scm :spl %:p:h/component.js<CR>
" map <Leader>sr :spl %:p:h/route.js<CR>
" map <Leader>st :spl %:p:h/template.hbs<CR>
" map <Leader>ss :spl %:p:h/service.js<CR>

inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> :w<CR>
vmap <c-s> <esc>:w<CR>gv
vmap <c-l> :Linediff<CR>
nmap <leader>gf :CtrlP<CR><C-\>w
nmap <leader>v :e ~/.vimrc<CR>

" map <c-d> :Dash 
map <Leader>d :Dash!<CR>

map <Leader>tc :call RunNearestSpec()<CR>
map <Leader>tf :call RunCurrentSpecFile()<CR>


let g:rspec_command = 'Dispatch bin/rspec {spec}'
let g:rspec_runner = "os_x_iterm2"

let g:using_zeus = 1

nnoremap <leader>r :call ToggleRspecCommand()<cr>

function! ToggleRspecCommand()
  if g:using_zeus
    let g:rspec_command = 'Dispatch rspec {spec}'
  else
    let g:rspec_command = 'Dispatch zeus rake rspec {spec}'
  endif

endfunction


map <C-b> :CtrlPBuffer<CR>
map <C-n> :call ToggleNERDTree()<CR>
map <leader>st :SyntasticToggleMode<CR>

function! ToggleNERDTree()
  :NERDTreeToggle
endfunction
nmap <C-q> :NERDTreeFind<CR>
map <C-c> <esc>
set backspace=2 "make backspace work like most other apps

let g:mustache_abbreviations = 1
if has("autocmd")
  au BufNewFile,BufRead *.{mustache,handlebars,hbs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif
nnoremap <S-Right> :vertical resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-K> :resize +1<CR>
nnoremap <S-J> :resize -1<CR>
nnoremap <Leader>tg :IndentGuidesToggle<CR>
nnoremap <leader>f :!echo -n %:p \| pbcopy<CR><CR>
"nnoremap gcc <Plug>CommentaryLine
let g:ctrlp_custom_ignore = '\v[\/](transpiled)|/dist/|tmp|tags|/public/uploads|bower_components|node_modules|(\.(swp|git|bak|pyc|DS_Store))$'
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>

let g:user_emmet_complete_tag = 1
let g:user_emmet_mode='i'
autocmd FileType html,handlebars,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

"" Ultisnips
let g:UltiSnipsEditSplit="vertical"
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_autoclose_preview_window_after_completion = 0
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
map <silent> W <Plug>CamelCaseMotion_w
map <silent> E <Plug>CamelCaseMotion_e
map <silent> B <Plug>CamelCaseMotion_b
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>


function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
"
let g:ctrlp_cmd = 'let g:ctrlp_newcache = 1 <bar> CtrlP'
let g:ctrlp_prompt_mappings = {
      \'PrtClearCache()': ['<c-z>'],
      \}
