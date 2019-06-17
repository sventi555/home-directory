let mapleader=" "

" display/style stuff
" *********************************** "
" sets the colour scheme
colorscheme monokai 
" disable line wrapping
set nowrap
" highlight searches
set hlsearch
" show current command
set showcmd
" show ruler
set ruler
" open new vertical split to right
set splitright
" open new horizontal splits below
set splitbelow
" show line numbers
set number
" line number is relative
set rnu
" enables syntax processing
syntax enable

" indentation stuff
" *********************************** "
" number of spaces a tab counts for
set tabstop=4
" number of spaces a tab counts for when editing
set softtabstop=4
" sets tabs to be spaces
set expandtab
" set block indent size
set shiftwidth=4
" filetype indentation
filetype plugin indent on
" AUTOINDENT
set smartindent

" other functionality
" *********************************** "
" set cwd to match current file in view
set autochdir


" Plugins
" *********************************** "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'scrooloose/nerdtree'
" open tree if vim is opened without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call vundle#end()


" Remaps
" *********************************** "
" Window related maps
map - <C-W>-
map + <C-W>+
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" nerdtree related maps
map <leader>n :NERDTreeToggle<CR>


" FUNCTIONS
" *********************************** "
func Tab(len)
    let &tabstop=a:len
    let &softtabstop=a:len
    let &shiftwidth=a:len
endfunc
