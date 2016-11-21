" enable line numbers
set number

" fix weird backspace behavior
set backspace=indent,eol,start

" make tabs put spaces in 
set expandtab
set tabstop=4

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

" mappings
inoremap jk <esc>
nnoremap <CR> ^i<CR><esc>
noremap <C-n> :set relativenumber! <enter>
" this is a shortcut for stopping all the sounds in overtone
" depends on having a stop macro in register a
noremap <C-c> @a 

" make filename completion more like bash
set wildmode=longest,list,full
set wildmenu

" yank to system clipboard automatically
set clipboard=unnamed

" statusline always shows
set laststatus=2

source ~/.vim/vim-plug-list.vim
