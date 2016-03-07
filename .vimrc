set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

" JS Plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'

" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
" TODO Needs additional installtion see http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Plugin 'Valloric/YouCompleteMe'
 
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Setter for editor window
set number                      " Line numbers on
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every four columns


" Enable syntax highlighting
syntax on
colorscheme monokai

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Show the filename in the window titlebar
set title

" Nerdtree config
map <C-e> :NERDTreeToggle<CR>

" Airline config
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'

" Make sure that copy and paste uses the clipboard register
"vmap <C-c> "+y
"imap <C-c> <Esc><Leader>p<Esc>"+y
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" For terminal vim + iterm2 we need to explicitly configure the cursor "
" for both insert mode as well as other modes "
" let &t_SI = '\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\'
" let &t_EI = '\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\'
