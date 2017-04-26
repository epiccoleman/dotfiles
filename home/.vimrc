" enable line numbers

set number

" fix weird backspace behavior
set backspace=indent,eol,start

" see top answer here
" http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=8 " max tab width
set softtabstop=0 " defensively - don't do softtab 
set expandtab " insert spaces instead of tab chars 
set shiftwidth=4 " size of an indent 
set smarttab

" search options 
set incsearch  " begin to match as you type 
set hlsearch   " highlight search entries
set ignorecase " ignorecase combined with smartcase means case is ignored
set smartcase  "   UNLESS you include caps in your search string

let g:netrw_liststyle = 3 " set default view to 'tree' in netrw file browser 

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

" mappings
inoremap jk <esc>
nnoremap <CR> ^i<CR><esc>
inoremap <S-Tab> <C-d>

" make filename completion more like bash
set wildmode=longest,list,full
set wildmenu

" yank to system clipboard automatically
set clipboard=unnamed

" statusline always shows
set laststatus=2

source ~/.vim/vim-plug-list.vim
