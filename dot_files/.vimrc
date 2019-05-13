" display/style stuff
" *********************************** "
" sets the colour scheme
colorscheme monokai 
" disable line wrapping
set nowrap

" window placement
" *********************************** "
" open new vertical split to right
set splitright

" indentation stuff
" *********************************** "
" show line numbers
set number
" enables syntax processing
syntax on
" number of spaces a tab counts for
set tabstop=4
" number of spaces a tab counts for when editing
set softtabstop=4
" sets tabs to be spaces
set expandtab
" set block indent size
set shiftwidth=4
" filetype indentation
filetype indent on
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
let g:netrw_winsize = 80
" new vertical split defaults to right side
let g:netrw_altv = 1
" hide certain files
let g:netrw_list_hide = '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git'

" plugin stuff
" *********************************** "
" enable pathogen
execute pathogen#infect()
