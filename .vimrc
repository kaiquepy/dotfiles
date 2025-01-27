set nocompatible

"#######################################################################

" automatically indent new lines
set autoindent

" replace tabs with spaces automatically
set expandtab

" number of spaces to replace a tab with when expandtab
set tabstop=2

" active relative line numbers
set relativenumber

" show comman
set showmode

"#######################################################################

syntax enable

" faster scrolling
set ttyfast

" highlight search hits
set incsearch
set hlsearch

" better command-line completion
set wildmenu
set wildmode=list:longest

" mostly used with >> and <<
set shiftwidth=2

set softtabstop=2

set smartindent

set smarttab

" color scheme
let g:gruvbox_italic=1
colorscheme gruvbox

" high contrast
set background=dark


" NERDTree
let NERDTreeMinimalUI=1
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
