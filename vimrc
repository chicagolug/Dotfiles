set nocompatible
filetype off

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

let g:rainbow_active = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|DS_Store)$',
  \ 'file': '\v\.(jpg|gif|pyc|swp|pid|scssc)$',
  \ }

au BufRead,BufNewFile *.md set filetype=markdown

map <C-n> :NERDTreeToggle<CR>
map <Leader>t :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>

syntax on

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set mouse=a


set hlsearch
set ignorecase
set smartcase
set incsearch
set expandtab
set shiftwidth=2
set tabstop=2
set number
set numberwidth=2
set autoindent
