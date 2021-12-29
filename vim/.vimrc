source $VIMRUNTIME/defaults.vim
source $HOME/.vim/cfg/coc.cfg
source $HOME/.vim/cfg/nerd.cfg


set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent

set rtp+=/usr/local/opt/fzf
set number relativenumber
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·


let $FZF_DEFAULT_COMMAND = 'find .'

filetype plugin on
syntax on

set splitbelow
set splitright

let mapleader="\\"
let maplocalleader="\\"
nnoremap <Leader>ft :topleft vsplit \| e.<CR>
