
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

syntax on
syntax enable

set number

set background=dark
set termguicolors
colorscheme gruvbox
