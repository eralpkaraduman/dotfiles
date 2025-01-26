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
Plug 'fedepujol/move.nvim'
call plug#end()

"Coc plugins
let g:coc_global_extensions = [
\ 'coc-pairs',
\ 'coc-highlight',
\ 'coc-git',
\ 'coc-eslint',
\ 'coc-lists',
\ 'coc-snippets',
\ 'coc-spell-checker',
\ 'coc-prettier',
\ 'coc-lua',
\ 'coc-tsserver',
\ 'coc-css',
\ 'coc-html',
\ 'coc-graphql',
\ 'coc-pyright',
\ '@yaegassy/coc-tailwindcss3',
\ ]

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

autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact

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

" Show Invisible Characters
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

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
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>Q :bufdo bd<CR>

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

" Hover Documentation
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>

" Go to References
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>

" Go to Definition
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>

" move.nvim
" add ghostty setting: macos-option-as-alt = true
lua << EOF
require('move').setup({})
EOF

" Normal-mode move.nvim keybindings
nnoremap <silent> <A-j> :MoveLine(1)<CR>
nnoremap <silent> <A-k> :MoveLine(-1)<CR>

" Visual-mode move.nvim keybindings
vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>

" Map <Leader>a to show code actions
nnoremap <silent> <Leader>a :lua vim.lsp.buf.code_action()<CR>
vnoremap <silent> <Leader>a :lua vim.lsp.buf.range_code_action()<CR>

" Rename
nnoremap <silent> <leader>r :lua vim.lsp.buf.rename()<CR>

" Use Tab to navigate and accept coc.nvim suggestions
inoremap <silent><expr> <Tab> 
      \ pumvisible() ? coc#pum#next(1) : 
      \ (copilot#Accept("") ==# "" ? "\<Tab>" : copilot#Accept(""))

" Use Shift-Tab to navigate up the completion menu
inoremap <silent><expr> <S-Tab> pumvisible() ? coc#pum#prev(1) : "\<Tab>"

" Use Enter to confirm the selected completion from coc.nvim
inoremap <silent><expr> <CR> pumvisible() ? coc#pum#confirm() : "\<CR>"

" Disable Copilot's default Tab mapping to avoid conflicts
let g:copilot_no_tab_map = v:true
inoremap <silent><expr> <S-CR> copilot#Accept("")

" Move between splits using <leader>h/j/k/l
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l

" Keybinding to list diagnostics (problems) in the current file
nnoremap <silent> <leader>d :CocList diagnostics<CR>

" Keybinding to search and run CoC commands
nnoremap <silent> <leader>c :CocCommand<CR>

