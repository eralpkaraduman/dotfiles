set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vimproc.vim'
Plug 'idanarye/vim-merginal'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/0.x',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \ }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'roxma/vim-tmux-clipboard'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary'
Plug 'kqito/vim-easy-replace'
Plug 'dart-lang/dart-vim-plugin'
Plug 'jparise/vim-graphql'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'github/copilot.vim'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'neovim/nvim-lspconfig' " Added for LSP configuration
call plug#end()

" Treesitter Configuration
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "tsx", "typescript", "json", "javascript",
    "astro", "css", "lua", "java", "jsdoc", 
    "python", "yaml", "swift"
  },
  highlight = {
    enable = true,
  },
}
EOF

" LSP Semantic Token Configuration
lua << EOF
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
})
EOF

" General Neovim Settings
syntax on
set termguicolors
set incsearch
set nowrap
set nu
set relativenumber
set showmatch
set matchtime=3
set cursorline
set mouse=a
set scrolloff=6
set autoread
au FocusGained,BufEnter * :checktime
set expandtab
set smartindent
set ignorecase
set smartcase
set signcolumn=yes
set timeoutlen=300
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" Theme Settings
colorscheme gruvbox
command! UpdateTheme call UpdateBackground()
function! UpdateBackground()
  let $DARK_THEME = system("defaults read -g AppleInterfaceStyle 2>/dev/null") ==# "Dark\n" ? 1 : 0
  if $DARK_THEME == 1
    set background=dark
  else
    set background=light
  endif
endfunction
autocmd VimEnter * call UpdateBackground()

" Keybindings and Quality of Life
let mapleader=" "
nnoremap <Leader>w :w<CR>
nnoremap <esc><esc> :noh<CR>

" Buffer Management Keybindings
nnoremap <silent> <Leader>q :confirm bd<CR>
nnoremap <silent> <Leader>Q :confirm bufdo bd<CR>

" Telescope
lua << EOF
local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    coc = {
      theme = 'ivy',
      prefer_locations = true,
    },
  },
})
require('telescope').load_extension('coc')
EOF

" Telescope Keybindings
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-f> <cmd>Telescope live_grep<CR>
nnoremap <C-s> <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-e> <cmd>Telescope buffers<CR>
nnoremap <leader>r :Telescope resume<CR>

" nvim-tree
lua << EOF
require'nvim-tree'.setup {
  update_focused_file = {
    enable = true,
  },
}
EOF
nmap <space>e :NvimTreeToggle<CR>

" Fugitive Git Keybindings
nmap <leader>gs :belowright G<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>gf :0Gclog<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gb :Git blame<CR>

" Resize Splits
nnoremap <silent> <A-L> :exe "vertical resize +1"<CR>
nnoremap <silent> <A-H> :exe "vertical resize -1"<CR>
nnoremap <silent> <A-J> :exe "resize +1"<CR>
nnoremap <silent> <A-K> :exe "resize -1"<CR>

" Use System Clipboard
noremap y "+y
noremap p "+p
noremap x "+x

" Exit Terminal Mode
autocmd TermOpen * startinsert
tnoremap jj <C-\><C-n>

" Line Moving
nnoremap  <A-k> :m .-2<CR>==
vnoremap  <A-j> :m '>+1<CR>gv=gv
nnoremap  <A-j> :m .+1<CR>==
vnoremap  <A-k> :m '<-2<CR>gv=gv
