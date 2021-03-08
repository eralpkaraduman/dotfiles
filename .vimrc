set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'cormacrelf/vim-colors-github'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme github
syntax on
set syntax=whitespace
set incsearch
set ignorecase
set smartcase
set nowrap
set nu
set noswapfile
set showmatch
set matchtime=3

nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>

"no more arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"line moving
nnoremap  <A-k> :m .-2<CR>==
vnoremap  <A-j> :m '>+1<CR>gv=gv
nnoremap  <A-j> :m .+1<CR>==
vnoremap  <A-k> :m '<-2<CR>gv=gv

"Disable dead keys for j and k
nmap ∆ <A-j>
nmap ˚ <A-k>

imap jj <Esc>

set laststatus=2
set statusline=%f "tail of the filename

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
