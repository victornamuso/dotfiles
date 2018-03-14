
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
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kana/vim-textobj-user.git'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mtth/scratch.vim'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'mxw/vim-jsx'

call vundle#end()            


if has ("autocmd")
  filetype indent plugin on
  " filetype indent on
endif
runtime macros/matchit.vim


filetype plugin indent on

"general vim settings
set novisualbell
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
let coffee_indent_keep_current = 1
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
set cursorline


iabbrev rpry require 'pry'; binding.remote_pry;

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>c :ccl<CR>
nnoremap <Leader>u :UltiSnipsEdit<CR>
nnoremap <Leader>sc :%! slackcat -c 
nnoremap <Leader>rn :set relativenumber<CR>
nnoremap <Leader>n :set number<CR>
nnoremap <Leader>rs :Eunittest<CR>
nnoremap <Leader>rrs :Vunittest<CR>
nnoremap <Leader>rm :Emodel<CR>
nnoremap <Leader>rrm :Vmodel<CR>
nnoremap <Leader>l :RV<CR>
nnoremap <Leader>2 <C-]>zz

"inoremap <esc> <nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

inoremap jk <ESC>
map <C-i> mzgg=G``zz
"open other files in the current directory
map <Leader>mm :e %:p:h/
map <Leader>vs :vsp %:p:h/
map <Leader>s :split %:p:h/
map <Leader>ot :tab split<CR>
map <Leader>xxt :tabc<CR>
map <Leader>a :Ack<CR>
map <Leader>w <ESC>:x<CR>

map <Leader>ec :e %:p:h/controller.js<CR>
map <Leader>ej :e %:p:h/component.js<CR>
map <Leader>er :e %:p:h/route.js<CR>
map <Leader>et :e %:p:h/template.hbs<CR>
map <Leader>es :e %:p:h/service.js<CR>
map <Leader>em :e %:p:h/model.js<CR>
map <leader>n :vsplit ~/Desktop/vim_tasks.md<CR>:vertical resize 60<CR><c-W>rG
map <leader>q :x<CR>


map <Leader>vec :vsplit %:p:h/controller.js<CR>
map <Leader>vej :vsplit %:p:h/component.js<CR>
map <Leader>ver :vsplit %:p:h/route.js<CR>
map <Leader>vet :vsplit %:p:h/template.hbs<CR>
map <Leader>ves :vsplit %:p:h/service.js<CR>
map <Leader>vem :vsplit %:p:h/model.js<CR>


inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> :w<CR>
vmap <c-s> <esc>:w<CR>gv
vmap <c-l> :Linediff<CR>
nmap <leader>gf :CtrlP<CR><C-\>w
nmap <leader>v :vsplit ~/.vimrc<CR>
nmap <leader>sv :vsplit<CR>

" map <c-d> :Dash 
map <Leader>d :Dash!<CR>

map <Leader>tc :call RunNearestSpec()<CR>
map <Leader>tf :call RunCurrentSpecFile()<CR>


let g:rspec_command = 'Dispatch bin/rspec {spec}'
let g:rspec_runner = "os_x_iterm2"

let g:rspec_mode = "spring"

nnoremap <leader>s :call SetRspecForSpring()<CR>
nnoremap <leader>g :call SetRspecForGem()<CR>
nnoremap <leader>z :call SetRspecForZeus()<CR>

nnoremap <leader>mn :call EmberAlternate()<CR>
nnoremap <leader>mm :call EmberAlternate(input('Param: '))<CR>
map <leader>xr :call EmberAlternate("r")<CR>
map <leader>xm :call EmberAlternate("m")<CR>
map <leader>xc :call EmberAlternate("c")<CR>
map <leader>xt :call EmberAlternate("t")<CR>
map <leader>xa :call EmberAlternate("a")<CR>
map <leader>xs :call EmberAlternate("s")<CR>

function! EmberAlternate(...)
  let tokens = split(expand("%"),"/")
  let file_name = tokens[-1]
  let directory = expand("%:p:h")
  let new_file = expand("%:p")

  let components_token = index(tokens,"components")
  if components_token != -1
    if file_name == "component.js"
      let new_file_name = fnamemodify('template.hbs', new_file)
    else
      let new_file_name = fnamemodify('component.js', new_file)
    endif

    let switch_name = directory . "/" . new_file_name
    execute "vsplit " . switch_name
  else
    let file = a:000[0]
    if file == "r"
      let new_file_name_base = "route.js"
    elseif file == "c"
      let new_file_name_base = "controller.js"
    elseif file == "t"
      let new_file_name_base = "template.hbs"
    elseif file == "m"
      let new_file_name_base "model.js"
    elseif file == "a" 
      let new_file_name_base = "adapter.js"
    elseif file == "s" 
      let new_file_name_base = "service.js"
    else
      echo "Invalid file type"
      return
    endif

      let x = fnamemodify(new_file_name_base,new_file)
      echo x
      let switch_name = directory . "/" . x
      execute "vsplit " . switch_name

      if new_file_name_base == "template.hbs"
	 silent :SyntasticToggleMode
      endif
  end
  
endfunction

function! SetRspecForSpring()
    let g:rspec_command = 'Dispatch bin/rspec {spec}'
endfunction

function! SetRspecForGem()
    let g:rspec_command = 'Dispatch rspec {spec}'
endfunction

function! SetRspecForZeus()
  let g:rspec_command = 'Dispatch zeus rspec {spec}'
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

" let g:mustache_abbreviations = 1
" if has("autocmd")
"   au BufNewFile,BufRead *.{mustache,handlebars,hbs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
" endif
nnoremap <S-Right> :vertical resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-K> :resize +1<CR>
nnoremap <S-J> :resize -1<CR>
nnoremap <Leader>tg :IndentGuidesToggle<CR>
nnoremap <leader>f :!echo -n %:p \| pbcopy<CR><CR>
"nnoremap gcc <Plug>CommentaryLine
let g:ctrlp_custom_ignore = '\v[\/](transpiled)|/dist/|tmp|tags|/public/uploads|bower_components|node_modules|deps|_build|(\.(swp|git|bak|pyc|DS_Store))$'
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
imap <C-z><C-z> <C-c>zza


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


let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 1
