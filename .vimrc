set nocompatible
set noswapfile
set nu
let mapleader = " "

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set runtimepath+=$HOME/.vim/pack/colors/opt/everforest/colors

if has("termguicolors")
  set termguicolors
endif
let g:everforest_background = 'hard'   " Options: 'soft', 'medium', 'hard'
let g:everforest_enable_italic = 0
let g:everforest_transparent_background = 0  " Set to 1 for transparent background

colorscheme everforest
syntax on

" Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=2

set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['ty server'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nmap <silent> gd <Plug>(lcn-definition)

nmap <silent> <leader>f <Plug>(fzf-maps-n)
nmap <silent> ff :GFiles<cr>
nmap <silent> gf :Files<cr>

vmap <silent> <leader>y "*y
vmap <silent> <leader>d "*d

nmap <silent> <leader>p "*p
vmap <silent> <leader>p "*p
nmap <silent> <leader>P "*P

nmap <silent> <C-j> 10j
nmap <silent> <C-k> 10k
nmap <silent> <C-x> :Ex<cr>
