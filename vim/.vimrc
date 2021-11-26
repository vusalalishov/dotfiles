source ./cfg/coc.cfg
source ./cfg/nerd.cfg


:nmap .r viwp
:set tabstop=2 shiftwidth=2 expandtab autoindent

set rtp+=/usr/local/opt/fzf
set number relativenumber

let $FZF_DEFAULT_COMMAND = 'find .'

filetype plugin on
syntax on

