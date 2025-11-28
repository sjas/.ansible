".vimrc
"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/paredit.vim'
Plug 'dense-analysis/ale'
call plug#end()

"# leaderkeys
"# general settings
"# colorscheme
"# statusline and ALE
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
".. show trailing spaces properly and lines longer than 110 characters
match ErrorMsg '\s\+$'
match ErrorMsg '\%110v.\+'
"display
se notitle  "'notitle' .. else it updates terminator title+tabs
se dy+=lastline  "'display'
se ls=2  "'laststatus'
se noru  "'noruler'
se noeb  "'noerrorbells'
se novb  "'novisualbell'
se wrap  "'nowrap'
se nolbr  "'nolinebreak'
se history=500  "'history' .. undo history length
se so=0  "'scrolloff'
se siso=5  "'sidescrolloff'
se sm  "'showmatch'.. -ing parens/brackets when typing the closing one
"autocompletion
se wim=list:longest,list:full  "'wildmode'
se cpt=.,w,t  "'complete'
"these are *magic* .. will show contents after editing (like more(1) vs. less(1))
se t_te=
se t_ti=

set clipboard^=unnamed,unnamedplus
se timeoutlen=250

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
"se backupdir=$TEMP
"se directory=$TEMP





"# colorscheme ##############################################################################################
"https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
"colo delek
colo desert
"colo badwolf
se bg=dark
"se bg=light
"highlight CursorLineNR ctermbg=red
"transparent background
hi Normal guibg=NONE ctermbg=NONE
highlight StatusLine    cterm=bold ctermfg=208 ctermbg=235
highlight StatusLineNC  cterm=bold ctermfg=15 ctermbg=238

"# statusline and ALE #######################################################################################
highlight ALEWarning ctermbg=DarkMagenta
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'python': ['ruff']
    \}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
let g:ale_completion_enabled = 1

""let g:syntastic_sh_shellcheck_args="-x"
function! LinterStatus() abort
    let l:counts=ale#statusline#Count(bufnr(''))
    let l:all_errors=l:counts.error+l:counts.style_error
    let l:all_non_errors=l:counts.total-l:all_errors
    return l:counts.total==0?'OK':printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline=%f\ %h%w%m%r
" NOTE: preceding line has a trailing space character
" ADD Syntastic
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* " END of default statusline (with ruler)
set statusline+=%=%-10.{LinterStatus()}
set statusline+=%=%-14.(%l,%c%V\ %=\ %P%)

nnoremap <leader>n :w<cr>:ll<cr>





"# shortcuts&&keybindings general ###########################################################################
nnoremap <f5> :UndotreeToggle<cr>
nnoremap Y y$

nnoremap <leader>fd :.!date +\%F_\%T<cr>
nnoremap <leader>scd O# shellcheck disable=SC

"fastrun binding
"nnoremap <leader>e :w %<cr>:!chmod +x %;clear;printf "1\n2\n3\n4\n5"; ./%<cr>

"better searching
nnoremap n nzt5<c-y>
nnoremap N Nzt5<c-y>
nnoremap * *zt5<c-y>

" spacemacs-similar bindings
nnoremap <leader>fe :e!<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>ffs :se noro<cr>:w !sudo tee %<cr><cr><cr>Ll<cr>
nnoremap <leader>fq :qa!<cr>
nnoremap <leader>wq :wq!<cr>
nnoremap <leader>fw :wq<cr>
nnoremap <leader>bd :q<cr>
nnoremap <leader>bp :N<cr>
nnoremap <leader>bn :n<cr>
nnoremap <leader>bN :vnew<cr>
nnoremap <leader>qq :qall!<cr>
"vimrc editing
nnoremap <leader>fed :sp $DOTFILES/roles/0x04_code/files/.vimrc<cr>
nnoremap <leader>ebv :vsp $DOTFILES/roles/0x04_code/files/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"autocmd #tepost .vimrc :source $MYVIMRC
"bash editing
nnoremap <leader>sb :!. ~/.bashrc<cr>
nnoremap <leader>eba :vs $DOTFILES/roles/0x02_shells/files/.bashrc_aliases<cr>
nnoremap <leader>ebe :vs $DOTFILES/roles/0x02_shells/files/.bashrc_env<cr>
nnoremap <leader>ebg :vs $DOTFILES/roles/0x02_shells/files/.bashrc_git<cr>
nnoremap <leader>t :ALEToggle<cr>


"nnoremap <leader>cl :s/^/#/<cr>/yoozu9PhiBei5cheicaec5AeG5shie2m<cr>
nnoremap <leader>cl :noh<cr>
nnoremap <leader>ln :se nu!<cr>
nnoremap <leader>nu :se nu!<cr>:se rnu!<cr>
nnoremap <leader>ls :se list!<cr>
nnoremap <leader>sh :sh<cr>
nnoremap <leader>fd :r!date +%%F_%%T<cr>o<cr>


"aliases
"vnoremap <leader>a :s/.*/"&"<cr>" "fixme what is this - not working proper

"fold
nnoremap <leader>i zMggM
nnoremap <leader>o zRzt
nnoremap <leader>l zAzt
"run
"nnoremap <leader>r :!chmod +x %; clear; ./%<cr>
nnoremap <leader>e :w %<cr>:!chmod +x %; echo; ./%<cr>
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

noremap  <leader>c  :s/^/#/<cr>:noh<cr>
vnoremap <leader>cc :s/^/# /<cr>gv:s/\s\+$//<cr>:noh<cr>
vnoremap <leader>c	:s/^/#/<cr>:noh<cr>
nnoremap <leader>nt :%s/\s\+$//<cr>

"vnoremap < <gv
"vnoremap > <gv

nnoremap n nzt5<c-y>
nnoremap * *zt5<c-y>

"# shortcuts&&keybindings bash&&markdown&&vim formatting ####################################################
"ANY:
"search current line (for navigation from the 'toc' to paragraph
nnoremap <leader>8 /\V<c-r>=escape(getline('.'),'\')<cr><cr>:noh<cr>zz
"headline from current line
nnoremap <leader>jl 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$o<esc>
"separator line
nnoremap <leader>- O<esc>109i#<esc>o
"uppercase and spaces inserted
nnoremap <leader>sp VgU:s/./& /g<cr>:s/^# 0 x \(.\) \(.\)   -   /#0x\1\2  -  /i<cr>yy
"small headline (####)
nnoremap <leader>h 0i#### <esc>o<esc>D



"MARKDOWN:
"headline from current line after five newlines
"nnoremap <leader>jj 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$O<cr><cr><cr><cr><cr><esc>jj
nnoremap <leader>jj 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d${{}d)O<cr><cr><cr><cr><esc>jj
"headline from current line after five newlines plus codeblock
nnoremap <leader>jjk 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d${{}d)O<cr><cr><cr><cr><esc>jji```<cr><cr>```<esc>k
"code block
nnoremap <leader>cc VgUO<esc>jo<esc>40i~<esc>yypO<esc>DkAbash<esc>j
"update toc (1 above and 3 empty lines below), and show it. (get back via c-o)
nnoremap <silent> <leader>mt mzgg}d}d/.<cr>O<cr>```<cr><cr><esc>k:redir @y<cr>:g/^## /p<cr>:redir END<cr>gg}}"ypdkdd}i```<cr><cr><cr><cr><cr><esc>kkkkk:noh<cr>gg}V}:s/ #\+$//<cr>:noh<cr>'zgg
"old: nnoremap <silent> <leader>mt mzgg}d}d/.<cr>O<cr>```<cr><cr><esc>k:redir @y<cr>:g/^## /p<cr>:redir END<cr>gg}}"ypdkdd}i```<cr><cr><cr><cr><cr><esc>kkkkk:noh<cr>gg}V}:s/^## //<cr>gv<cr>:s/#\+$//<cr>:noh<cr>'zgg



"VIM:
"update toc (1 above and 3 empty lines below), and show it. (get back via c-o)
nnoremap <silent> <leader>vt mzgg}d}d/.<cr>O<esc>DO<esc>:redir @y<cr>:g/^"# /p<cr>:redir END<cr>gg}"ypdk}i<cr><esc>gg}V}:s/ #\+$//<cr>:noh<cr>o<esc>Do<cr><esc>D'zgg
"headline from current line after five newlines
nnoremap <leader>vj 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$0r"o<esc>kO<esc>Di<cr><cr><cr><cr><esc>jjx
"headline from current line
nnoremap <leader>vl 0i## <esc>$a  <esc>109i#<esc>0109l<esc>d$0r"o<esc>x



"BASH:
"update toc (1 above and 3 empty lines below), and show it. (get back via c-o)
nnoremap <silent> <leader>bt mzgg}d}d/.<cr>O<cr><esc>:redir @y<cr>:g/^## /p<cr>:redir END<cr>gg}"ypdk}i<cr><esc>gg}V}:s/ #\+$//<cr>:noh<cr>o<cr><cr><esc>'zgg
"box with unchanged letter-casing
nnoremap <leader>hl I# <esc>A #<esc>yyPVr#yyjp<cr>
"box with uppercase content
nnoremap <leader>Hl I# <esc>A #<esc>VgUyyPVr#yyjp<cr>
"box with spaced uppercase content
nnoremap <leader>HL I# <esc>A #<esc>:s/./&  /g<cr>$xxyyPVr#yyjpPVr 0r#$r#yykkpjjjj:nohl<cr>
"surrounding lines for current line
nnoremap <leader>ll ddP0O<esc>109i#<esc>yyjpj
