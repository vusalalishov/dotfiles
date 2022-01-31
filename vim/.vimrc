let mapleader=";"
let maplocalleader=";"

source $VIMRUNTIME/defaults.vim
source $HOME/.vim/cfg/coc.cfg
source $HOME/.vim/cfg/nerd.cfg


set tabstop=4 softtabstop=4 shiftwidth=4 autoindent
set ignorecase smartcase ruler

set rtp+=/usr/local/opt/fzf
set number relativenumber
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·


let $FZF_DEFAULT_COMMAND = 'find .'

filetype plugin on
syntax on

set splitbelow
set splitright

nnoremap <Leader>ft :NERDTree<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>f :Rg<CR>

" navigation
map <C-j> 10j
map <C-k> 10k
map <C-h> 5b
map <C-l> 5w

" [buffer number] followed by filename:
set statusline=[%n]\ %t
" show line#:column# on the right hand side
set statusline+=%=%l:%c
