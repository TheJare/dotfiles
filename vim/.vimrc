set nocompatible

" ------------------
" Vundle stuff
" One-time manual install:
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" ------------------
" My stuff
set bg=dark

set langmenu=en_US.UTF-8
set virtualedit=block
set path+=**

set incsearch
set hlsearch
set ignorecase
set smartcase

set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

syntax on
filetype indent on
set number
set cursorline
set wildmenu
set showmatch
set ruler laststatus=2 showcmd showmode

set switchbuf=usetab,newtab
"set showtabline=2

let mapleader = "\<Space>"
" create horizontal and vertical splits
nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <Leader>e <C-w>s<C-w>j
" navigate splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" save, open, etc
nnoremap <Leader>s :w<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>c :bd<CR>
" system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" CtrlP
" git clone https://github.com/kien/ctrlp.vim.git ~/.vimrc/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

