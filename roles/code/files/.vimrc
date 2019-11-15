if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/paredit.vim'
call plug#end()

colo badwolf
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:paredit_mode = 1

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

" transparent background
hi Normal guibg=NONE ctermbg=NONE

se ts=4
se sts=4
se et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>

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
nnoremap <leader>fq :wq<cr>
nnoremap <leader>fqq :wq!<cr>
nnoremap <leader>qq :qall!<cr>
nnoremap <leader>fed :vs $DOTFILES/roles/code/files/.vimrc<cr>
nnoremap <leader>feR :!cp $DOTFILES/roles/code/files/.vimrc /home/sjas/.vimrc<cr>:source $MYVIMRC<cr>
nnoremap <leader>cl :s/^/#/<cr>/asdf<cr>
nnoremap <leader>tn :se nu!<cr>
nnoremap <leader>sh :sh<cr>
nnoremap <leader>ln :se nu!<cr>:se rnu!<cr>
nnoremap <leader>fd :r!date<cr>o<cr>

"aliases
vnoremap <leader>a :s/.*/"&"<cr>
	
"fold
nnoremap <leader>i zMggM
nnoremap <leader>o zRzt
nnoremap <leader>l zAzt
"run
"nnoremap <leader>r :!chmod +x %; clear; ./%<cr>
nnoremap <leader>e :w %<cr>:!chmod +x %; echo; clear; ./%<cr>
"fmt
nnoremap <leader>fg :w %<cr>:!go fmt %<cr>:<backspace>
nnoremap <leader>fgg :w %<cr>:!go fmt %<cr>
nnoremap <leader>fr :w %<cr>:!rust fmt %<cr>
nnoremap <leader>fp :w %<cr>:%!yapf3<cr>

nnoremap <leader>hl O<esc>o<esc>o<esc>o<esc>o<esc>o<esc>109i#<esc>yyjpj

nnoremap <leader>gh ipackage main<cr><cr>import "fmt"<cr><cr>func main() {<cr><cr>}<esc>ka<tab>
nnoremap <leader>ph i#!/usr/bin/env python

"vnoremap < <gv
"vnoremap > <gv

nnoremap  <leader>eba :vs $DOTFILES/roles/bash/files/.bashrc_aliases<cr>
nnoremap  <leader>ebe :vs $DOTFILES/roles/bash/files/.bashrc_env<cr>
nnoremap  <leader>ebg :vs $DOTFILES/roles/bash/files/.bashrc_git<cr>

nnoremap n nzt5<c-y>
nnoremap * *zt5<c-y>
