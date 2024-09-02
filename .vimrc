" BASE :: VIM OPTIONS
set nocompatible			" be iMproved, required
filetype on				" required
syntax on				" Syntax highlighting
set t_Co=256				" Fix colors
set encoding=utf-8			" UTF-8
set backspace=indent,eol,start		" Backspace over lines
set scrolloff=99			" TODO: ?
set number				" line numbering
let g:netrw_altv=1			" TODO: ?
let g:netrw_liststyle=3			" default list style
set laststatus=2
nmap          <C-W><     <C-W><<SID>ws	" Enables hold to resize splits
nmap          <C-W>>     <C-W>><SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nmap          <SID>ws    <Nop>

nmap          <C-W>+     <C-W>+<SID>ws	" ^^^^
nmap          <C-W>-     <C-W>-<SID>ws
nn <script>   <SID>ws+   <C-W>+<SID>ws
nn <script>   <SID>ws-   <C-W>-<SID>ws
nmap          <SID>ws    <Nop>

" VUNDLE CONFIG :: https://github.com/VundleVim/Vundle.vim
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()		" All plugins must be loaded between vundle#begin/end
Plugin 'VundleVim/Vundle.vim'	" let Vundle manage Vundle, required
Plugin 'psf/black'		" Official black plugin


call vundle#end()
filetype plugin indent on	" required

" Black Config
let g:black_fast = 1
let g:black_linelength = 99
let g:black_quiet = 1

" ALE Config :: https/github.com/dense-analysis/ale.git
" Set fixers for :ALEFix
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['black', 'ruff'],
\  'javascript': ['eslint', 'prettier', 'prettier_standard'],
\  'svelte': ['css', 'javascript'],
\}
let g:ale_linter_aliases = {'svelte': ['css', 'javscript']}
let g:ale_linters = {
\  'svelte': ['styelint', 'eslint'],
\  'python': ['ruff', 'pylsp', 'mypy'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc	" trigger ALE autocomplete with <C-x><C-o>


" JS/HTML/CSS
" Python
" indentation
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 autoindent
autocmd FileType html setlocal shiftwidth=2 tabstop=2 autoindent
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab autoindent fileformat=unix
let python_highlight_all=1

" General
" Mark extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/


packloadall			" Load plugins
silent! helptags ALL		" Load helptags, ignore messages/errors
