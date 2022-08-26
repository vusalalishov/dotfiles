let mapleader=" "
let maplocalleader=" "

source $VIMRUNTIME/defaults.vim


set tabstop=4 softtabstop=4 shiftwidth=4 autoindent
set ignorecase smartcase ruler

set rtp+=/usr/local/opt/fzf
set number relativenumber
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

set foldmethod=manual
set nofoldenable

let $FZF_DEFAULT_COMMAND = 'ag .'
let g:indentLine_setConceal = 0

filetype plugin on
syntax on
set background=dark

set splitbelow
set splitright

nnoremap <Leader>ft :NERDTreeToggle<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>f :Rg<CR>

" yanking/pasting from the clipboard
nnoremap <leader>y "*
vnoremap <leader>y "*
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" window resizing
map <leader>hi <C-w>3>
map <leader>hd <C-w>3<

" useful mappings
inoremap <c-u> <esc>viwUwa
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <C-f> :BLines<cr>

" buffer
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" navigation
map <C-j> 10j
map <C-k> 10k
map <C-h> 5b
map <C-l> 5w


" [buffer number] followed by filename:
set statusline=[%n]\ %t
" show line#:column# on the right hand side
set statusline+=%=%l:%c

packadd! everforest

color everforest

hi Comment ctermfg=white cterm=NONE
