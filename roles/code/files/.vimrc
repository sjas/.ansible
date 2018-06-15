syn on
se hls
se is
se ic
se ai
se nonu
se clipboard=unnamedplus

"se backupdir=$TEMP
"se directory=$TEMP

" LEADER bindings
" spacebar, entered via ctrl_v,<space>
let mapleader = ' '
let maplocalleader = ','

" SPACEMACS bindings
nnoremap <leader>fs :w<cr>
nnoremap <leader>ffs :w !sudo tee %<cr><cr>L<cr>
nnoremap <leader>bd :q<cr>
nnoremap <leader>bp :N<cr>
nnoremap <leader>bn :n<cr>
nnoremap <leader>bN :vnew<cr>
nnoremap <leader>fqq :wq!<cr>
nnoremap <leader>qq :qall!<cr>
nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>feR :source $MYVIMRC<cr>
nnoremap <leader>cl :s/^/#/<cr>/asdf<cr>
nnoremap <leader>tn :se nu!<cr>
nnoremap <leader>sh :sh<cr>

"vnoremap < <gv
"vnoremap > <gv

nnoremap  <leader>ev  :vs $DOTFILES/roles/code/files/.vimrc<cr>
nnoremap  <leader>eba :vs $DOTFILES/roles/bash/files/.bashrc_aliases<cr>
nnoremap  <leader>ebe :vs $DOTFILES/roles/bash/files/.bashrc_env<cr>
nnoremap  <leader>ebg :vs $DOTFILES/roles/bash/files/.bashrc_git<cr>

