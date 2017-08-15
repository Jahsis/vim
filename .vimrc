" Sample .vimrc file by Martins Jakubovics

" Auto reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
" set mouse=a

" Preventing Backspace and Delete keys
set bs=2

" Bind <Leader> key
let mapleader = ","

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

"vno <up> <Nop>
"vno <right> <Nop>
"vno <left> <Nop>
"vno <down> <Nop>

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

" Color whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
set t_Co=256
color wombat256

" Syntax highlighting
filetype off
filetype plugin indent on
syntax on

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

" Tabs
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4
set shiftround
set expandtab

autocmd FileType puppet set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Pathogen
call pathogen#infect()

" Powerline
" pip install --user git+git://github.com/Lokaltog/powerline
" wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
" mv PowerlineSymbols.otf to ~/.fonts/
" wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
" mv 10-powerline-symbols.conf ~/.fonts.conf.d/
" set laststatus=2
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

set laststatus=2
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" Python editing
set nofoldenable
let g:pymode_rope = 0
