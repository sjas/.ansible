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
se hls  "hlsearch
se is  "incsearch
se ic  "ignorecase
se ai  "autoindent
se nonu  "nonumber
se nornu  "norelativenumber
highlight CursorLineNR ctermbg=red
se ar  "autoread
se clipboard=unnamedplus
se foldmethod=syntax
se lbr  "linebreak

" transparent background
hi Normal guibg=NONE ctermbg=NONE

se ts=4  "tabstop
se sw=4  "shiftwidth
se sts=4  "softtabstop
se et  "expandtab
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
nnoremap <leader>sv :!cp $DOTFILES/roles/code/files/.vimrc /home/sjas/.vimrc<cr>:source $MYVIMRC<cr>
"nnoremap <leader>cl :s/^/#/<cr>/asdf<cr>
nnoremap <leader>cl :noh<cr>
nnoremap <leader>tn :se nu!<cr>
nnoremap <leader>sh :sh<cr>
nnoremap <leader>ln :se nu!<cr>:se rnu!<cr>
nnoremap <leader>fd :r!date +%%F_%%T<cr>o<cr>



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

nnoremap <leader>hl I# <esc>A #<esc>VgUyyPVr#yyjp<cr>
nnoremap <leader>HL I# <esc>A #<esc>:s/./&  /g<cr>$xxyyPVr#yyjpPVr 0r#$r#yykkpjjjj:nohl<cr>

nnoremap <leader>ll P0O<esc>109i#<esc>yyjpj
nnoremap <leader>lls O<esc>o<esc>o<esc>o<esc>o<esc>o<esc>0<esc>PO<esc>109i#<esc>yyjpj
nnoremap <leader>hk VgU:s/./& /g<cr>:s/^# 0 x \(.\) \(.\)   -   /#0x\1\2  -  /i<cr>yy

nnoremap <leader>gh ipackage main<cr><cr>import "fmt"<cr><cr>func main() {<cr><cr>}<esc>ka<tab>
nnoremap <leader>ph i#!/usr/bin/env python

"vnoremap < <gv
"vnoremap > <gv

nnoremap <leader>sb :!. ~/.bashrc<cr>
nnoremap  <leader>eba :vs $DOTFILES/roles/bash/files/.bashrc_aliases<cr>
nnoremap  <leader>ebe :vs $DOTFILES/roles/bash/files/.bashrc_env<cr>
nnoremap  <leader>ebg :vs $DOTFILES/roles/bash/files/.bashrc_git<cr>


nnoremap n nzt5<c-y>
nnoremap * *zt5<c-y>
