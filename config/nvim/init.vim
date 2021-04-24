" Plugin Stuff
call plug#begin()
    " add Gruvbox Theme
    Plug 'gruvbox-community/gruvbox'

    " add vim-go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " git plugin
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

call plug#end()

let skip_defaults_vim=1
set nocompatible

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab

" Appearance
set textwidth=100
set showmode
set icon
set foldmethod=manual
set background=dark
set number
set relativenumber
set cmdheight=2
set signcolumn=yes
set scrolloff=8

" easier to see characters when `set paste` is on
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
highlight NonText guifg=bg

" Search
set linebreak
map <silent> <leader><cr> :noh<cr>:redraw!<cr>

" Formatoptions
set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars in join
set formatoptions+=1   " don't break a line after a one-letter word

" Key Mappings
"
" set space as leader, clear beforhand
nnoremap <SPACE> <Nop>
let mapleader=" "
" use F2 to switch special to paste mode
"nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" fuzzy finder
nnoremap <silent> <leader>f :FZF<CR>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

" Gruvbox Settings
" Add settings before colorscheme gruvbox
colorscheme gruvbox

" Vim-Go Settings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1

" show go-info
" like parameters and return types
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_auto_sameids = 1

" Autocommands
"
" Trim Whitespace
"
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup juicybit
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
