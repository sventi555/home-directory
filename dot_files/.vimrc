" display/style stuff
" *********************************** "
" sets the colour scheme
colorscheme monokai 
" disable line wrapping
set nowrap
" highlight searches
set hlsearch

" bottom bar
" *********************************** "
" show current command
set showcmd
" show ruler
set ruler

" window placement
" *********************************** "
" open new vertical split to right
set splitright
" open new horizontal splits below
set splitbelow

" line numbers
" *********************************** "
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

" netrw stuff
" *********************************** "
" tree view
let g:netrw_liststyle = 3
" don't show banner
let g:netrw_banner = 0
" open files in horizontal split
let g:netrw_browse_split = 4
" browser width
let g:netrw_winsize = 25
" new vertical split defaults to right side
let g:netrw_altv = 1
" hide certain files
let g:netrw_list_hide = '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,tags'

" Plugins
" *********************************** "
" enable man plugin
runtime! ftplugin/man.vim

" FUNCTIONS
" *********************************** "
func Tab(len)
    let &tabstop = a:len
    let &softtabstop = a:len
    let &shiftwidth = a:len
endfunc
