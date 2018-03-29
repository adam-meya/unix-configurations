set expandtab
set autoread
set shiftwidth=4
set softtabstop=4
set nu
set nocompatible
syntax on
set smartindent
set autoindent
set hlsearch
filetype plugin on
filetype indent on
"set background=dark"
hi Search guibg=LightBlue
let g:lua_inspect_events = ''

let g:ConqueTerm_CloseOnEnd=1
set ruler

"colorscheme koehler
colorscheme elflord

"set clipboard=unnamedplus
set scrolljump=8
set scrolloff=8
set splitright
set splitbelow

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
let g:ConqueTerm_ReadUnfocused=1

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"MOONSCRIPT HINT This is useful for rewriting 'a = ()' to 'a: ': 
"s/\.\(\w*\) = /\1: /


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/sources/typescript-tools.vim/
au BufRead,BufNewFile *.ts        setlocal filetype=typescript
au BufRead,BufNewFile *.tsx       setlocal filetype=typescript
au BufRead,BufNewFile *.tl        setlocal filetype=lua
au BufRead,BufNewFile *.v        setlocal filetype=coq
au BufRead,BufNewFile *.moon        setlocal filetype=moon
au BufWritePre *.py %s/\s\+$//e 
au BufWritePre *.py %s#\($\n\s*\)\+\%$##e
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'leafgarland/typescript-vim'

Bundle 'airblade/vim-gitgutter'
Bundle "wesQ3/vim-windowswap"
Bundle 'leafo/moonscript-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround' 
Bundle 'tpope/vim-abolish' 
Bundle 'rosenfeld/conque-term'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'the-lambda-church/coquille'
Bundle 'psosera/ott-vim'
Bundle "junegunn/fzf"
Bundle "junegunn/fzf.vim"
Bundle "w0rp/ale"
"Bundle "vim-airline/vim-airline"
Bundle "mkomitee/vim-gf-python"
Bundle "Vimjas/vim-python-pep8-indent"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

runtime! plugin/sensible.vim

au BufNewFile,BufRead *.den setlocal ft=yaml


" For citymode
colorscheme pablo

let maplocalleader = ","
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap = <Plug>(EasyAlign)=
"
"
" " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

function! LocationNext()
  try
    lnext
  catch
    try | lfirst | catch | endtry
  endtry
endfunction

map <silent> <C-E> :call LocationNext()<cr>i
imap <silent> <C-E> <ESC>:call LocationNext()<CR>i

map <silent> ; :w <CR>
map <silent> <F4> :ConqueTermVSplit bash -e r <CR>

"map <silent> <F6> :ConqueTermVSplit bash <CR>"
"imap <silent> <F6> <ESC>:ConqueTermVSplit bash <CR>"

"map <silent> <F4> :ConqueTermVSplit bash -e /home/adomurad/sources/moai-game/run.sh <CR>
"imap <silent> <F4> <ESC>:ConqueTermVSplit bash -e /home/adomurad/sources/moai-game/run.sh <CR>r 
" 

map <silent> <C-O> :FZF <CR>
imap <silent> <C-O> <ESC> :FZF <CR>


map <silent> <C-F> :FZF <CR>
imap <silent> <C-F> <ESC> :FZF <CR>
" map <silent> <F6> :CoqNext <CR>
" imap <silent> <F6> <ESC> :CoqNext <CR>
" map <silent> <F7> :CoqToCursor <CR>
" imap <silent> <F7> <ESC> :CoqToCursor <CR>

" map <silent> <C-O> :O 
" imap <silent> <C-O> <ESC> :O 

"nmap <silent> <C-Right> :wincmd h<CR>
"nmap <silent> <C-Down> :wincmd j<CR>
"nmap <silent> <C-Up> :wincmd k<CR>
"nmap <silent> <C-Left> :wincmd l<CR>

highlight Comment ctermfg=magenta
highlight String ctermfg=red
highlight Type ctermfg=green

set backspace=indent,eol,start " backspace over everything in insert mode

"  \ '': 'vsplit',
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:python_highlight_all = 1
set mouse=a

" Check Python files with flake8 and pylint.
let g:ale_linters = {
\   'python': ['pylint', 'flake8'],
\   'javascript': ['eslint']
\}

let g:ale_set_highlights = 0
let g:ale_open_list = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_keep_list_window_open = 1
let g:ale_list_window_size_max = 5
let b:ale_list_window_size = 1
let g:ale_python_pylint_options = "--disable=missing-docstring --disable=too-few-public-methods --disable=import-error --disable=invalid-name --disable=redefined-builtin --disable=too-many-instance-attributes --disable=too-many-arguments --disable=fixme --disable=ungrouped-imports --disable=no-self-use --disable=too-many-return-statements --disable=no-else-return --disable=wrong-import-order --disable=len-as-condition --disable=too-many-public-methods --disable=superfluous-parens --disable=too-many-locals --disable=too-many-statements --disable=too-many-branches --disable=broad-except"
" Reduce overlap with pylint:
let g:ale_python_flake8_options = "--ignore=F401,F811,F841,E722"

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

call ale#Set('sign_style_error', g:ale_sign_warning)


autocmd User ALELint call s:ale_loclist_limit()
function! s:ale_loclist_limit()
    if exists("b:ale_list_window_size_max")
        let b:ale_list_window_size = min([len(ale#engine#GetLoclist(bufnr('%'))), b:ale_list_window_size_max])
    elseif exists("g:ale_list_window_size_max")
        let b:ale_list_window_size = min([len(ale#engine#GetLoclist(bufnr('%'))), g:ale_list_window_size_max])
    endif
endfunction

nnoremap <C-M> :vertical wincmd f<CR>
vnoremap <C-M> :vertical wincmd f<CR>

nnoremap <C-E> :vertical wincmd f<CR>
vnoremap <C-E> :vertical wincmd f<CR>
imap <silent> <C-E> <ESC>:vertical wincmd f<CR>i

nnoremap <C-T> :ConqueTermVSplit bash<CR>
vnoremap <C-T> :ConqueTermVSplit bash<CR>
imap <silent> <C-T> <ESC>:ConqueTermVSplit bash<CR>

set path+=/Users/adomurad/sources/locl
let g:ConqueTerm_CloseOnEnd=1

" TODO organize this better
"if has("unix")
"  let s:uname = system("uname")
"  if s:uname == "Darwin\n"
"    " Do Mac stuff here
"  endif
"endif
set clipboard=unnamed
map <M-s> :w<kEnter>  "Works in normal mode, must press Esc first"
imap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
