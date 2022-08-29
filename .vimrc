set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround',
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dbakker/vim-projectroot'
Plug 'airblade/vim-rooter'
Plug 'srcery-colors/srcery-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vimproc.vim'
Plug 'idanarye/vim-merginal'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/0.x',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \ }
Plug 'ap/vim-css-color'
Plug 'digitaltoad/vim-pug'
Plug 'roxma/vim-tmux-clipboard'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'tpope/vim-commentary'
Plug 'kqito/vim-easy-replace'
  " <leader>rc / <leader>ra

Plug 'mlaursen/vim-react-snippets'
  "Install pip (required y nvim snippets)
  "`sudo apt install python3-pip`
  "Install pynvim (required by nvim snippets)
  "`python3 -m pip install --user --upgrade pynvim`

Plug 'dart-lang/dart-vim-plugin'
Plug 'phaazon/hop.nvim'
Plug 'jparise/vim-graphql'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'github/copilot.vim'
call plug#end()

"Coc plugins
let g:coc_global_extensions = [
\ 'coc-pairs',
\ 'coc-html',
\ 'coc-highlight',
\ 'coc-git',
\ 'coc-eslint',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-css',
\ 'coc-lists',
\ 'coc-snippets',
\ 'coc-spell-checker',
\ 'coc-flutter-tools',
\ 'coc-prettier',
\ ]

let g:coc_node_path = '~/.nvm/versions/node/v16.15.0/bin/node'

" Dark colorscheme
" set background=dark
" colorscheme srcery
" let g:srcery_italic = 1

" Light colorscheme
set background=light
autocmd vimenter * ++nested colorscheme solarized8


syntax on
set incsearch
set nowrap
set nu
set relativenumber
set showmatch
set matchtime=3
set cursorline
"set mouse=niv
set mouse=a
"set clipboard=unnamedplus
set scrolloff=6
set autoread
au FocusGained,BufEnter * :checktime
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set ignorecase
set termguicolors
set smartcase
set signcolumn=no
" set signcolumn=yes
" set colorcolumn=100
"set notimeout
set timeoutlen=300

:command! W w
:command! WQ wq
:command! Wq wq

set noswapfile
set nobackup
" create this directory
set undodir=~/.vim/undodir
set undofile

" CTRL-N and CTRL-P will be automatically bound to next-history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" exit terminal mode with esc
" tnoremap <Esc> <C-\><C-n>
" tnoremap jj <C-\><C-n>
imap jj <Esc>

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Set Space as leader
let mapleader=" "

" hide numbers on terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" use system clipboard
noremap y "+y
noremap p "+p
noremap x "+x

" Fugitive stuff
" nmap <leader>gs :vertical G<CR>
nmap <leader>gs :belowright G<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>gf :Gclog -- %<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gb :Git blame<CR>
" nmap <leader>gl :diffget //3<CR>
" nmap <leader>gh :diffget //2<CR>

" Change between splits fast
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Run vim command under cursor
nnoremap <leader>r yy:@"<CR>

" fzf.vim's GFiles but with cwd (for monorepos, see: https://github.com/junegunn/fzf.vim/pull/1160#issuecomment-801601546)
command! -bang -nargs=? GFilesCwd
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(<q-args> == '?' ? { 'dir': getcwd(), 'placeholder': '' } : { 'dir': getcwd() }), <bang>0)

nmap <C-p> :GFilesCwd --exclude-standard --others --cached<CR>
nmap <C-e> :Buffers<CR>

"hop.nvim
lua require'hop'.setup()
nmap <C-h> :HopWord<CR>

" For scss files
autocmd FileType scss setl iskeyword+=@-@

"no more arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Set tab width to 2 columns
set tabstop=2
" Use 2 columns for indentation
set shiftwidth=2
" Use spaces when pressing <tab> key
set expandtab

" set filetypes as typescriptreact (setting of vim-jsx-typescript) (doesn't
" seem to be installed tho, uncommenting below)
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"tsx", "typescript", "json", "javascript", "astro", "css"},
  highlight = {
    enable = true
  } 
}
EOF

autocmd BufRead,BufEnter *.astro set filetype=astro

" Line moving
nnoremap  <A-k> :m .-2<CR>==
vnoremap  <A-j> :m '>+1<CR>gv=gv
nnoremap  <A-j> :m .+1<CR>==
vnoremap  <A-k> :m '<-2<CR>gv=gv

" Disable mac \"English ABC\" keyboard dead keys for j and k
nmap ∆ <A-j>
nmap ˚ <A-k>

" Save
nnoremap <Leader>w :w<cr>

" Clear search highlights
nnoremap <esc><esc> :noh<return>

set laststatus=2
set statusline=\ %f "tail of the filename
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Search Stuff
" Install bat for syntax highlighted previews: https://github.com/sharkdp/bat#installation

let g:rooter_patterns = ['package.json','.git']

" function! RipgrepFzfAdvanced(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction
" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" nnoremap <silent> <C-f> :RG<cr>

command! -bang -nargs=* RipgrepFzf
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)
nnoremap <silent> <C-f> :RipgrepFzf<cr>

" nnoremap <silent> <C-f> :ProjectRootExe Ag<cr>
" nnoremap <silent> <C-f>f :<C-u>ProjectRootExe Ag <cr>g
" vnoremap <silent> <C-f>f y:ProjectRootExe Ag <C-r>=fnameescape(@")<CR><CR>

" coc.nvim sample configuration below based on: https://github.com/neoclide/coc.nvim

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif

" Use <tab> and <S-tab> to navigate completion list: 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion: 

inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, use: 

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use: 

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode: 

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
elseif (coc#rpc#ready())
  call CocActionAsync('doHover')
else
  execute '!' . &keywordprg . " " . expand('<cword>')
endif
endfunction

" Show documentation on K (based on: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim )
nnoremap <silent> K :call CocAction('doHover')<CR>

" Show documentation automatically
"function! ShowDocIfNoDiagnostic(timer_id)
"  if (coc#float#has_scroll() == 0 && coc#status() != '')
"    silent call CocActionAsync('doHover')
"  endif
"endfunction
"
"function! s:show_hover_doc()
"  call timer_start(500, 'ShowDocIfNoDiagnostic')
"endfunction
"
"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><nowait> <space>b  :<C-u>CocList buffers<CR>

" nvim-tree
lua << EOF
require("nvim-tree").setup({
  update_focused_file = {
    enable = true 
  }     
})
EOF

nmap <space>e :NvimTreeToggle<CR>

