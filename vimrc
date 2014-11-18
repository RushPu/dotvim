""""""""""""""""""""""""""""""""""""""""
" General

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

set number

set laststatus=2

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

""""""""""""""""""""""""""""""""""""""""
" Vundle Setting Begin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on github repo
"plugin 'tpope/vim-fugitve'
Plugin 'morhetz/gruvbox'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'carlobaldassi/ConqueTerm'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" id a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Vundle Setting End
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Apperance Setting Start

" colorscheme gruvbox setting
colorscheme gruvbox
set background=dark    " Setting dark mode

" Italics gets inverted issue
if !has("gui_running")
   let g:gruvbox_italic=0
endif

" terminal color scheme issue
set t_Co=256

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ Bold\ 10
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h12
        set fuoptions=maxvert,maxhorz
    elseif has("gui_win32")
        set guifont=Inconsolata:h12
    endif
endif

" Apperance Setting End
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Text related

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Indent related
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

""""""""""""""""""""""""""""""""""""""""
" Key ShortCut
let mapleader = " "

" set paste mode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" useful shortcuts
nmap <Leader>so :source $MYVIMRC<CR>
nmap <Leader>sb :split rightbelow<Space>
nmap <Leader>sa :split leftabove<Space>
nmap <Leader>vr :vertical rightbelow<Space>
nmap <Leader>vr :vertical leftabove<Space>
nmap <Leader>nh :nohl<CR>

" Copy & Paste to sysytem clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" expand region for v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" search and cs for replace highlighting string
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Enter and Backspace enhanced in normal mode
nnoremap <CR> G
nnoremap <BS> gg

" Nerdtree Setting
map <F2> :NERDTreeToggle<CR>

" Vim-Powerline Setting
let g:Powerline_symbols= "fancy"
set fillchars+=stl:\ ,stlnc:\
let Powerline_symbols = "compatible"

" Python-mode
" Keys:
" K             Show python docs
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Enable pymode-motion, pymode-run
let g:pymode_motion = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

" Don't autofold code
let g:pymode_folding = 0

" Close rope for Jedi Vim
let g:pymode_rope = 0

" Automatically fix PEP8 errors in the current buffer
noremap <F8> :PymodeLintAuto<CR>

" Jedi-vim
" Keys:
" <Tab>        Autocompletion
" <Leader>g    Go to definitions
" <Leader>d    Go to original definition
let g:jedi#use_tabs_not_buffers = 0
let jedi#use_splits_not_buffers = "right"
