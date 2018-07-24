" Sample .vimrc file by Martins Jakubovics

" Auto reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Enable folding
set foldmethod=indent
" set foldmethod=syntax
set foldlevel=99
set nofoldenable
" Enable folding with the spacebar
nnoremap <space> za

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" After that:
" :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'Valloric/YouCompleteMe'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Yggdroot/indentLine'
Plugin 'gmarik/Vundle.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'morhetz/gruvbox'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

" For YouCompleateMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']
map <C-m> :NERDTreeToggle<CR>

set bs=2

" Bind <Leader> key
let mapleader = ","

" 
let g:syntastic_python_checkers = ['pyflakes', 'python', 'flake8']

" Bind nohl
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Unbind arrow keys
"no <up> <Nop>
"no <right> <Nop>
"no <left> <Nop>
"no <down> <Nop>

"ino <up> <Nop>
"ino <right> <Nop>
"ino <left> <Nop>
"ino <down> <Nop>

"vno <down> <Nop>
"vno <left> <Nop>
"vno <right> <Nop>
"vno <up> <Nop>

" Moving between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Sort function to a key
vnoremap <Leader>s :sort<CR>

" Moving block of code
vnoremap < <gv
vnoremap > >gv


" Color scheme
" set t_Co=256
" color wombat256

" gruvbox
let g:gruvbox_invert_indent_guides=1
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
set background=dark

" Airline theme
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Syntax highlighting
filetype off
filetype plugin indent on

" Show line number and length
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Show cursor line
set cursorline

" History
set history=700
set undolevels=700

""" Tabs
set shiftround
set autoindent
set expandtab
set ts=4
set shiftwidth=4

autocmd FileType html setl ts=4 sts=4 shiftwidth=4
autocmd FileType php setl ts=4 sts=4 shiftwidth=4
autocmd FileType puppet setl ts=2 sts=2 shiftwidth=2
autocmd FileType python setl ts=4 sts=4 shiftwidth=4
autocmd FileType yaml setl ts=2 sts=2 shiftwidth=2
autocmd Filetype css setl ts=2 sts=2 sw=2 expandtab
autocmd Filetype htmldjango setl ts=4 sts=4 sw=4 expandtab
autocmd Filetype typescript setl ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setl ts=2 sts=2 sw=2 expandtab

autocmd BufNewFile,BufRead *.tpl set shiftwidth=2 tabstop=2 softtabstop=2

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

set laststatus=2

" Ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


set t_BE=

" indentLine
let g:indentLine_concealcursor=1
