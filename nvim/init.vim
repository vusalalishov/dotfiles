let mapleader = " "

set nocompatible
set noswapfile
set nu

set encoding=utf-8
set cursorline

filetype off
syntax on

vmap <silent> <leader>y "*y
vmap <silent> <leader>d "*d

nmap <silent> <leader>p "*p
vmap <silent> <leader>p "*p
nmap <silent> <leader>P "*P

nmap <silent> <C-j> 10j
nmap <silent> <C-k> 10k
nmap <silent> <C-x> :Ex<cr>
