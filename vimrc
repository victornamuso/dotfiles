set nocompatible

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
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
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
Plugin 'vim-syntastic/syntastic'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kana/vim-textobj-user.git'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'mtth/scratch.vim'
Plugin 'vim-scripts/genutils'
Plugin 'albfan/vim-breakpts'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'joukevandermaas/vim-ember-hbs'


"Plugin 'mxw/vim-jsx'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'gregsexton/MatchTag'
"Plugin 'majutsushi/tagbar'

call vundle#end()            


runtime macros/matchit.vim

autocmd FileType html,handlebars,css EmmetInstall
syntax enable
filetype  indent on
filetype plugin on


set list
set lcs+=space:·,eol:.
set novisualbell
set noerrorbells                       " Don't beep
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set expandtab
set number
let mapleader = ","
set clipboard=unnamed
set timeout timeoutlen=5000 ttimeoutlen=100
set regexpengine=1
set iskeyword+=-
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set tabstop=2 shiftwidth=2 softtabstop=2
set incsearch                          " Do incremental searching
set noswapfile 
set cursorline


let coffee_indent_keep_current = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
let g:rspec_command = 'Dispatch rspec {spec}'
let g:rspec_runner = "os_x_iterm2"
let g:rspec_mode = "spring"
let g:ctrlp_custom_ignore = '\v[\/](transpiled)|/dist/|tmp|tags|/public/uploads|bower_components|node_modules|deps|_build|(\.(swp|git|bak|pyc|DS_Store))$'

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
let g:ctrlp_cmd = 'let g:ctrlp_newcache = 1 <bar> CtrlP'
let g:ctrlp_prompt_mappings = {
      \'PrtClearCache()': ['<c-z>'],
      \}
let g:loaded_sql_completion = 0
let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 1
let g:ycm_filetype_blacklist = {
      \ 'dbext' : 1
      \}


"old emmet settings
let g:user_emmet_complete_tag = 1
let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<C-Z>'


set backspace=2 "make backspace work like most other apps

"Mappings

imap <C-z><C-z> <C-c>zza
imap <c-x><c-j> <plug>(fzf-complete-file-ag)

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <c-s> :w<CR>

nnoremap <S-Right> :vertical resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-K> :resize +1<CR>
nnoremap <S-J> :resize -1<CR>

nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <Leader>tg :IndentGuidesToggle<CR>
nnoremap <leader>f :!echo -n %:p \| pbcopy<CR><CR>
nnoremap <leader>. :CtrlPTag<cr>
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
nnoremap <leader>s :call SetRspecForSpring()<CR>
nnoremap <leader>ms :call SetRspecForMonoSpring()<CR>
nnoremap <leader>g :call SetRspecForGem()<CR>
nnoremap <leader>z :call SetRspecForZeus()<CR>
nnoremap <leader>mn :call EmberAlternate()<CR>
nnoremap <leader>mm :call EmberAlternate(input('Param: '))<CR>

inoremap jk <ESC>
inoremap <c-s> <Esc>:w<CR>

vmap <c-s> <esc>:w<CR>gv
vmap <c-l> :Linediff<CR>
vmap <Left> <gv
vmap <Right> >gv

nmap <leader>gf :CtrlP<CR><C-\>w
nmap <leader>v :vsplit ~/.vimrc<CR>
nmap <leader>sv :vsplit<CR>
nmap <C-q> :NERDTreeFind<CR>
nmap <Left> <<
nmap <Right> >>


map <silent> W <Plug>CamelCaseMotion_w
map <silent> E <Plug>CamelCaseMotion_e
map <silent> B <Plug>CamelCaseMotion_b

map <C-i> mzgg=G``zz
map <C-c> <esc>
map <C-b> :CtrlPBuffer<CR>
map <C-n> :call ToggleNERDTree()<CR>

map <leader>l :<C-u>%s/,/,\r/g<CR>
map <Leader>d :Dash!<CR>
map <Leader>tc :call RunNearestSpec()<CR>
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <leader>xr :call EmberAlternate("r")<CR>
map <leader>xm :call EmberAlternate("m")<CR>
map <leader>xc :call EmberAlternate("c")<CR>
map <leader>xt :call EmberAlternate("t")<CR>
map <leader>xa :call EmberAlternate("a")<CR>
map <leader>xs :call EmberAlternate("s")<CR>
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
map <leader>st :SyntasticToggleMode<CR>

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

function! ToggleNERDTree()
  :NERDTreeToggle
endfunction

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

function! SetRspecForMonoSpring()
  let g:rspec_command = 'cd ./api/bin && Dispatch bin/rspec {spec}'
endfunction

function! SetRspecForGem()
  let g:rspec_command = 'Dispatch rspec {spec}'
endfunction

function! SetRspecForZeus()
  let g:rspec_command = 'Dispatch zeus rspec {spec}'
endfunction

augroup hbs
  au!
  autocmd BufNewFile,BufRead *.hbs   set syntax=html
augroup END
