" New stuff
"
"
"
lua << EOF
  vim.lsp.config('expert', {
    cmd = { 'expert', '--stdio' },
    root_markers = { 'mix.exs', '.git' },
    filetypes = { 'elixir', 'eelixir', 'heex' },
  })
  vim.lsp.enable('expert')
EOF


"
" Stuff we're definitely keeping:
" enable line numbers
set number
"
"
" search options
set incsearch  " begin to match as you type
set hlsearch   " highlight search entries
set ignorecase " ignorecase combined with smartcase means case is ignored
set smartcase  "   UNLESS you include caps in your search string

let g:netrw_liststyle = 3 " set default view to 'tree' in netrw file browser
let g:netrw_banner = 0    " don't show netrw banner by default ('I' will toggle it)

" leader key
let mapleader='\'
"doing it this way means \ can show up in showcmd instead of nothing
nmap <Space> <leader>

" mappings
inoremap jk <esc>
nnoremap <CR> ^i<CR><esc>
inoremap <S-Tab> <C-d>

nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>n :noh<CR>

nnoremap <Leader>fs :write<CR>
nnoremap <Leader>fS :wall<CR>
nnoremap <Leader>sc :noh<CR>

" porting over spacemacs window movement commands
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wd <C-w>q

set mouse=a "make the mouse work, how did i not already have this

set splitbelow "open new horizontal splits below current one
set splitright "open new vertical splits to right of current one
set notermguicolors " just use the terminal color scheme. this will probably cause some annoyance someday

lua require('config.lazy')

