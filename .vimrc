" Base
set nocompatible
filetype off
set encoding=utf-8
set backspace=indent,eol,start
highlight Pmenu ctermbg=blue guibg=blue
set scrolloff=99

" Customize editor
set number
set splitbelow
set termwinsize=10*0
let g:netrw_banner=0
let g:NERDTreeHijackNetrw=0
let g:netrw_winsize=25
let g:netrw_altv=1
let g:netrw_liststyle=3

nmap          <C-W><     <C-W><<SID>ws
nmap          <C-W>>     <C-W>><SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nmap          <SID>ws    <Nop>

nmap          <C-W>+     <C-W>+<SID>ws
nmap          <C-W>-     <C-W>-<SID>ws
nn <script>   <SID>ws+   <C-W>+<SID>ws
nn <script>   <SID>ws-   <C-W>-<SID>ws
nmap          <SID>ws    <Nop>



" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" User Plugins
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'evanleck/vim-svelte'

" End user plugins
call vundle#end()
filetype plugin indent on


" Enable code tools
set foldmethod=indent
set foldlevel=99
syntax on
" nnoremap <space> za " Map spacebar to fold/unfold


" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Svelte indentation
au BufNewFile,BufRead *.svelte
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix



" Mark extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" JS/HTML/CSS indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
