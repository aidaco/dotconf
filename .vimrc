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

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" User Plugins
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'

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
    \ set textwidth=120 |
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
