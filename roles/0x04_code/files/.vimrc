".vimrc
"
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

"# leaderkeys
"# general settings
"# colorscheme
"# statusline&&syntastic, must be combined
"# shortcuts&&keybindings general
"# shortcuts&&keybindings bash&&markdown&&vim formatting





"# leaderkeys ###############################################################################################
let mapleader = " "  "this is a literal space inserted with c-v space
let maplocalleader = ','





"# general settings #########################################################################################
syn on
"general
filetype plugin indent on
se nocp  "'nocompatible' .. to vi(1)
sy on  "'syntax' .. highlighting
se hid  "'hidden' .. open buffers are allowed
se enc=utf-8  "'encoding'
se ar  "'autoread' .. background file changes
se cf  "'confirm' .. exit unsaved file
"se dir=~/.cache/vim  "'directory' .. to store swap files
se nospell  "'nospell' .. -checking
"searching
se hls  "'highlightsearch'
se ic  "'ignorecase'
se sc  "'smartcase'
se is  "'incsearch'
"indenting
se ai  "'autoindent'
se si  "'smartindent'
se fdm=indent  "'foldmethod' .. 'indent' not 'syntax'??? fixme
se fdn=3  "'foldnestmax'
se nofen  "'nofoldenable'
se fo+=j  "'formatoptions' .. remove comments when joining lines
"linenumbers
se nonu  "'nonumbers'
se nornu  "'norelativenumbers'
"shifts&&tabs
se ts=4  "'tabsize'
se sw=4  "'shiftwidth'
se sts=4  "'softtabstop'
se noet  "'noexpandtab' .. use tabs not spaces
se sr  "'shiftround'
se bs=indent,eol,start  "'backspace'
se nolist  "'nolist'
se lcs=eol:$,tab:>\ ,space:•,multispace:•••+,trail:•,nbsp:~  "'listchars' .. space is 'c-k . M'
 ".. show trailing spaces properly
match ErrorMsg '\s\+$'
"display
se notitle  "'notitle' .. else it updates terminator title+tabs
se dy+=lastline  "'display'
se ls=2  "'laststatus'
se noru  "'noruler'
se noeb  "'noerrorbells'
se novb  "'novisualbell'
se wrap  "'wrap'
se nolbr  "'nolinebreak'
se history=250  "'history' .. undo history length
se so=0  "'scrolloff'
se siso=5  "'sidescrolloff'
se sm  "'showmatch'.. -ing parens/brackets when typing the closing one
"autocompletion
se wim=list:longest,list:full  "'wildmode'
se cpt=.,w,t  "'complete'
"*magic* .. shows contents after editing (like more(1) vs. less(1))
se t_te=
se t_ti=

se clipboard=unnamedplus

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
"se backupdir=$TEMP
"se directory=$TEMP





"# colorscheme ##############################################################################################
"https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
"colo desert
"colo badwolf
colo delek
se bg=dark
"se bg=light
"highlight CursorLineNR ctermbg=red
"transparent background
hi Normal guibg=NONE ctermbg=NONE
highlight StatusLine    cterm=bold ctermfg=208 ctermbg=235
highlight StatusLineNC  cterm=bold ctermfg=15 ctermbg=238
"# statusline&&syntastic, must be combined ##################################################################
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
"let g:syntastic_sh_shellcheck_args="-x"
"fixme this doesnt work
"let g:syntastic_sh_checkers = ["sh","shellcheck"]
"let g:syntastic_sh_checkers = ["bashate","sh","shellcheck"]
"let g:syntastic_sh_checkers = ["checkbashisms","sh","shellcheck"]
"let g:syntastic_sh_checkers = ["bashate","checkbashisms","sh","shellcheck"]
"set stl=%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P  "'statusline' .. default?  START statusline default
set statusline=%f\ %h%w%m%r
" NOTE: preceding line has a trailing space character
" ADD Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* " END of default statusline (with ruler)
set statusline+=%=%-14.(%l,%c%V\ %=\ %P%)

nnoremap <leader>n :w<cr>:ll<cr>





"# shortcuts&&keybindings general ###########################################################################
nnoremap Y y$

nnoremap <leader>fd :.!date +\%F_\%T<cr>
nnoremap <leader>scd O# shellcheck disable=SC

"fastrun binding
nnoremap <leader>e :w %<cr>:!chmod +x %;clear;printf "1\n2\n3\n4\n5"; ./%<cr>

"better searching
nnoremap n nzt5<c-y>
nnoremap N Nzt5<c-y>
nnoremap * *zt5<c-y>

" spacemacs-similar bindings
nnoremap <leader>fs :w<cr>
nnoremap <leader>fe :e!<cr>
nnoremap <leader>ffs :se noro<cr>:w !sudo tee %<cr><cr><cr>Ll<cr>
nnoremap <leader>fq :qa!<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>bd :q<cr>
nnoremap <leader>bp :N<cr>
nnoremap <leader>bn :n<cr>
nnoremap <leader>bN :vnew<cr>
nnoremap <leader>fw :wq!<cr>
nnoremap <leader>qq :qall!<cr>
"vimrc editing
nnoremap <leader>fed :sp $DOTFILES/roles/0x04_code/files/.vimrc<cr>
nnoremap <leader>ebv :vsp $DOTFILES/roles/0x04_code/files/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
autocmd bufwritepost .vimrc :source $MYVIMRC
"bash editing
nnoremap <leader>sb :!. ~/.bashrc<cr>
nnoremap <leader>eba :vs $DOTFILES/roles/0x02_shells/files/.bashrc_aliases<cr>
nnoremap <leader>ebe :vs $DOTFILES/roles/0x02_shells/files/.bashrc_env<cr>
nnoremap <leader>ebg :vs $DOTFILES/roles/0x02_shells/files/.bashrc_git<cr>


"nnoremap <leader>cl :s/^/#/<cr>/asdf<cr>
nnoremap <leader>cl :noh<cr>
nnoremap <leader>nu :se nu!<cr>
nnoremap <leader>ln :se nu!<cr>:se rnu!<cr>
nnoremap <leader>ls :se list!<cr>
nnoremap <leader>sh :sh<cr>
nnoremap <leader>fd :r!date +%%F_%%T<cr>o<cr>


"aliases
"vnoremap <leader>a :s/.*/"&"<cr>" "fixme what is this

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

"nnoremap <leader>ll P0O<esc>109i#<esc>yyjpj "see EOF in bash settings? 
nnoremap <leader>lls O<esc>o<esc>o<esc>o<esc>o<esc>o<esc>0<esc>PO<esc>109i#<esc>yyjpj
nnoremap <leader>hk VgU:s/./& /g<cr>:s/^# 0 x \(.\) \(.\)   -   /#0x\1\2  -  /i<cr>yy

nnoremap <leader>gh ipackage main<cr><cr>import "fmt"<cr><cr>func main() {<cr><cr>}<esc>ka<tab>
nnoremap <leader>ph i#!/usr/bin/env python3

"vnoremap < <gv
"vnoremap > <gv

nnoremap n nzt5<c-y>
nnoremap * *zt5<c-y>

"# shortcuts&&keybindings bash&&markdown&&vim formatting ####################################################
"ANY: search current line (for navigation from the 'toc' to paragraph
nnoremap <leader>8 /\V<c-r>=escape(getline('.'),'\')<cr><cr>:noh<cr>zz
"ANY: headline from current line
nnoremap <leader>jl 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$o<esc>
"ANY: separator line
nnoremap <leader>- O<esc>109i#<esc>o
"ANY: uppercase and spaces inserted
nnoremap <leader>sp VgU:s/./& /g<cr>:s/^# 0 x \(.\) \(.\)   -   /#0x\1\2  -  /i<cr>yy
"ANY: small headline (####)
nnoremap <leader>h 0i#### <esc>o<esc>D

"MARKDOWN: headline from current line after five newlines
"nnoremap <leader>jj 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$O<cr><cr><cr><cr><cr><esc>jj
nnoremap <leader>jj 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d${{}d)O<cr><cr><cr><cr><esc>jj
"MARKDOWN: headline from current line after five newlines plus codeblock
nnoremap <leader>jjk 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d${{}d)O<cr><cr><cr><cr><esc>jji```<cr><cr>```<esc>k
"MARKDOWN: code blockk
nnoremap <leader>c VgUO<cr><cr><esc>jo<esc>40i~<esc>yypO<esc>DkAbash<esc>j
"MARKDOWN: update toc (1 above and 3 empty lines below), and show it. (get back via c-o)
nnoremap <silent> <leader>mt mzgg}d}d/.<cr>O<cr>```<cr><cr><esc>k:redir @y<cr>:g/^## /p<cr>:redir END<cr>gg}}"ypdkdd}i```<cr><cr><cr><cr><cr><esc>kkkkk:noh<cr>gg}V}:s/ #\+$//<cr>:noh<cr>'zgg
"old: nnoremap <silent> <leader>mt mzgg}d}d/.<cr>O<cr>```<cr><cr><esc>k:redir @y<cr>:g/^## /p<cr>:redir END<cr>gg}}"ypdkdd}i```<cr><cr><cr><cr><cr><esc>kkkkk:noh<cr>gg}V}:s/^## //<cr>gv<cr>:s/#\+$//<cr>:noh<cr>'zgg

"VIM: update toc (1 above and 3 empty lines below), and show it. (get back via c-o)
nnoremap <silent> <leader>vt mzgg}d}d/.<cr>O<esc>DO<esc>:redir @y<cr>:g/^"# /p<cr>:redir END<cr>gg}"ypdk}i<cr><esc>gg}V}:s/ #\+$//<cr>:noh<cr>o<esc>Do<cr><esc>D'zgg
"VIM: headline from current line after five newlines
nnoremap <leader>vj 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$0r"o<esc>kO<esc>Di<cr><cr><cr><cr><esc>jjx
"VIM: headline from current line
nnoremap <leader>vl 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$0r"o<esc>x

"BASH: update toc (1 above and 3 empty lines below), and show it. (get back via c-o)
nnoremap <silent> <leader>bt mzgg}d}d/.<cr>O<cr><esc>:redir @y<cr>:g/^## /p<cr>:redir END<cr>gg}"ypdk}i<cr><esc>gg}V}:s/ #\+$//<cr>:noh<cr>o<cr><cr><esc>'zgg
"BASH: box with unchanged letter-casing
nnoremap <leader>hl I# <esc>A #<esc>yyPVr#yyjp<cr>
"BASH: box with uppercase content
nnoremap <leader>Hl I# <esc>A #<esc>VgUyyPVr#yyjp<cr>
"BASH: box with spaced uppercase content
nnoremap <leader>HL I# <esc>A #<esc>:s/./&  /g<cr>$xxyyPVr#yyjpPVr 0r#$r#yykkpjjjj:nohl<cr>
"BASH: surrounding lines for current line
nnoremap <leader>ll ddP0O<esc>109i#<esc>yyjpj

