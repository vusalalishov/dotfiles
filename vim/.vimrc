let mapleader=" "
let maplocalleader=" "

source $VIMRUNTIME/defaults.vim
source $HOME/projects/dotfiles/vim/.cocrc

set completeopt+=menuone,noselect,noinsert
set hidden

set tabstop=4 softtabstop=4 shiftwidth=4 autoindent
set ignorecase smartcase ruler

set rtp+=/usr/local/opt/fzf
set number relativenumber
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

set foldmethod=manual
set foldlevelstart=1
set nofoldenable

let $FZF_DEFAULT_COMMAND = 'ag .'
let g:indentLine_setConceal = 0

filetype plugin on
syntax on
set omnifunc=syntaxcomplete#Complete
set background=dark

set splitbelow
set splitright

let g:NERDTreeMinimalMenu=1

nnoremap <Leader>ft :NERDTreeToggle<CR>
nnoremap <C-w>p :NERDTreeFind<cr>
nnoremap <Leader>ff :Files<CR>
nnoremap ff :GFiles<CR>
nnoremap <Leader>f :Rg<CR>

" spell
set spell spelllang=en_us

augroup filetypes
	au!
	au FileType yaml,markdown,gitcommit setlocal spell
augroup end

nnoremap sn ]s
nnoremap sN [s
nnoremap sf :call FzfSpell()<CR>

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"), 10)
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

" ALE
let g:ale_fixers = {
    \ 'java': ['google_java_format'],
    \ }
let g:ale_linters = {
      \ 'java': ['eclipselsp'],
      \ 'go': ['gofmt', 'golangci-lint', 'vet']
      \ }

" alternate buffers
nnoremap <BS> <C-^>

" vim-go
nnoremap <C-d> :GoDecls<CR>

" coc
nnoremap <leader>sd :call CocActionAsync('doHover')<CR> 

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
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <C-s> :wa<CR>

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
hi SpellBad cterm=underline

function! GotoJump()
" show dialog where we can choose the jump from the list
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
