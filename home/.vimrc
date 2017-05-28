" enable line numbers
set number

" fix weird backspace behavior
set backspace=indent,eol,start

" INDENTING
" see top answer here
" http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=8 " max tab width
set softtabstop=0 " defensively - don't do softtab 
set expandtab " insert spaces instead of tab chars 
set shiftwidth=4 " size of an indent 
set smarttab

" ruby indent rules
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
filetype plugin indent on

" search options 
set incsearch  " begin to match as you type 
set hlsearch   " highlight search entries
set ignorecase " ignorecase combined with smartcase means case is ignored
set smartcase  "   UNLESS you include caps in your search string

let g:netrw_liststyle = 3 " set default view to 'tree' in netrw file browser 
let g:netrw_banner = 0    " don't show netrw banner by default ('I' will toggle it)

" .md files are markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" syntax highlighting and theme
syntax enable
" fixes a display issue on linux
highlight! link Visual Cursorline
set background=dark 
" see https://github.com/altercation/vim-colors-solarized#advanced-configuration
" use transparent background - needed on linux
let g:solarized_termtrans = 1
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

set showcmd "show cmd in bottom right corner

source ~/.vim/vim-plug-list.vim
