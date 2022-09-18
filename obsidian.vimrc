nmap j gj
nmap k gk

nmap H ^
nmap L $
imap jj <Esc>
" Quickly remove search highlights
nmap <esc><esc> :nohl

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

" Follow link under cursor (set obsidian shortcut to Ctrl+Alt+Enter )
nmap gd <C-S-CR>

exmap focusRight obcommand editor:focus-right
nmap <C-l> :focusRight

exmap focusLeft obcommand editor:focus-left
nmap <C-h> :focusLeft

exmap focusTop obcommand editor:focus-top
nmap <C-j> :focusTop

exmap focusBottom obcommand editor:focus-bottom
nmap <C-k> :focusBottom
