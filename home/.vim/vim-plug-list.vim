call plug#begin()

" theme
Plug 'epiccoleman/vim-colors-solarized',{ 'do': './install.sh' }

" universal functionality
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'

" lang-specific
Plug 'tpope/vim-fireplace'
Plug 'tmux-plugins/vim-tmux'

call plug#end()
