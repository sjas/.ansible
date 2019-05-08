syn on
se hls
se is
se ic
se ai
se nonu
se nornu
highlight CursorLineNR ctermbg=red
se ar
se clipboard=unnamedplus
se foldmethod=syntax

"se backupdir=$TEMP
"se directory=$TEMP

" LEADER bindings
" spacebar, character here was entered via ctrl_v,<space>
let mapleader = ' '
let maplocalleader = ','

" spacemacs-similar bindings
nnoremap <leader>fs :w<cr>
nnoremap <leader>fe :e!<cr>
nnoremap <leader>ffs :w !sudo tee %<cr><cr>L<cr>
nnoremap <leader>bd :q<cr>
nnoremap <leader>bp :N<cr>
nnoremap <leader>bn :n<cr>
nnoremap <leader>bN :vnew<cr>
nnoremap <leader>fqq :wq!<cr>
nnoremap <leader>qq :qall!<cr>
nnoremap <leader>fed :vs $DOTFILES/roles/code/files/.vimrc<cr>
nnoremap <leader>feR :!cp $DOTFILES/roles/code/files/.vimrc /home/sjas/.vimrc<cr>:source $MYVIMRC<cr>
nnoremap <leader>cl :s/^/#/<cr>/asdf<cr>
nnoremap <leader>tn :se nu!<cr>
nnoremap <leader>sh :sh<cr>
nnoremap <leader>ln :se nu!<cr>:se rnu!<cr>

"aliases
vnoremap <leader>a :s/.*/"&"<cr>
	
"fold
nnoremap <leader>i zMzz
nnoremap <leader>o zRzz
nnoremap <leader>l zAzz
"run
nnoremap <leader>r :!./%<cr>
"fmt
nnoremap <leader>fg :w %<cr>:!go fmt %<cr>:<backspace>
nnoremap <leader>fgg :w %<cr>:!go fmt %<cr>
nnoremap <leader>fr :w<cr>!rust fmt %<cr>

nnoremap <leader>hl O<esc>o<esc>o<esc>o<esc>o<esc>o<esc>109i#<esc>yyjpj

"vnoremap < <gv
"vnoremap > <gv

nnoremap  <leader>eba :vs $DOTFILES/roles/bash/files/.bashrc_aliases<cr>
nnoremap  <leader>ebe :vs $DOTFILES/roles/bash/files/.bashrc_env<cr>
nnoremap  <leader>ebg :vs $DOTFILES/roles/bash/files/.bashrc_git<cr>

nnoremap n nzt5<c-y>
nnoremap * *zt5<c-y>
