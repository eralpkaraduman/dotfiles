let g:airline_powerline_fonts = 1
set directory=$HOME/.nvim/swapfiles/
set backupdir=$HOME/.nvim/backupfiles/
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|node_modules|build)$'
  \ }
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
let g:mapleader='\\'
set formatoptions=tcrq
set textwidth=80
set nowrap
set number
set clipboard^=unnamed,unnamedplus
set nocompatible
set mouse=a
set nofoldenable
set termguicolors
set t_Co=256
syntax on
" For mouse click in NERDTree
let g:NERDTreeMouseMode=3
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 4 spaces.
set shiftwidth  =2         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set backspace   =indent,eol,start  " Make backspace work as you would expect
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set ttyfast                " Faster redrawing.
#set lazyredraw             " Only redraw when necessary.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif
set wildmode=longest:full,full
" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"" Libraries
call plug#begin()
" ... Plugins will be here
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-sensible'
Plug 'phanviet/vim-monokai-pro'
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'
Plug 'chrisbra/changesPlugin'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
call plug#end()

set termguicolors
colorscheme monokai_pro
let g:airline_theme='minimalist' " <theme> is a valid theme name
autocmd BufWritePre *.js Neoformat

let g:indent_guides_enable_on_vim_startup = 1
