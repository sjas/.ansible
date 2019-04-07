syn on
se hls
se is
se ic
se ai
se nonu
se ar
se clipboard=unnamedplus

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

nnoremap <leader>l :!go fmt %<cr>:<backspace>
nnoremap <leader>fr :!./%<cr>

nnoremap <leader>hl O<esc>o<esc>o<esc>o<esc>o<esc>o<esc>109i#<esc>yyjpo

"vnoremap < <gv
"vnoremap > <gv

nnoremap  <leader>eba :vs $DOTFILES/roles/bash/files/.bashrc_aliases<cr>
nnoremap  <leader>ebe :vs $DOTFILES/roles/bash/files/.bashrc_env<cr>
nnoremap  <leader>ebg :vs $DOTFILES/roles/bash/files/.bashrc_git<cr>

nnoremap n nzt5<c-y>
nnoremap * *zt5<c-y>
