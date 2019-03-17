" Plugins
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

" Gruvbox Config
let g:gruvbox_contrast_dark='soft'

"" General
syntax on
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.
set showmatch                   " set show matching parenthesis

" Linenumbers
set number
set relativenumber

"" Colors
set background=dark
let base16colorspace=256
set t_Co=256                    " 256 color mode
colorscheme gruvbox
"set termguicolors

"" Whitespace
"set wrap                       " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
set softtabstop=4               " Sets the number of columns for a TAB
set shiftround
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight search
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive
set smartcase                   " ... unless they contain at least one capital letter


"" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

"" Movement
" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Tab navigation like Firefox.
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>
" autocmd BufWritePre * StripWhitespace
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" easier split navigation
" move with ctrl-j k l h

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" always open splits to the right and below
set splitbelow
set splitright


" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

"" Backup and swap files
set backupdir=/tmp// " where to put backup files.
set undodir=/tmp//
set directory=/tmp// " where to put swap files.


