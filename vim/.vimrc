set nocompatible
set hidden

" ------------------
" Vundle stuff
" Necessary one-time manual bootstrap (if vim complains about this .vimrc):
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   then start vim and run :PluginInstall command
filetype off

let s:vimrcBase=expand("<sfile>:h")
let iCanHazVundle=1
let s:bundlesDir=s:vimrcBase . "/.vim/bundles"
let s:vundleBase=s:bundlesDir . "/Vundle.vim"
let vundle_readme=expand(s:vundleBase . '/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent execute("!mkdir -p " . s:bundlesDir)
  silent execute("!git clone https://github.com/VundleVim/Vundle.vim.git " . s:vundleBase)
  let iCanHazVundle=0
endif

if empty(&rtp)
  let &rtp=s:vundleBase
else
  let &rtp=&rtp.','.s:vundleBase
endif

call vundle#begin(s:bundlesDir)
Plugin 'VundleVim/Vundle.vim'

"Plugin 'altercation/vim-colors-solarized'
"Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'itchyny/lightline.vim'

Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'vim-ctrlspace/vim-ctrlspace'
" Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/syntastic'

"Plugin 'derekwyatt/vim-scala'
"Plugin 'rust-lang/rust.vim'
Plugin 'sheerun/vim-polyglot'
"Plugin 'racer-rust/vim-racer'

" All of your Plugins must be added before the following line
call vundle#end()
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif
filetype plugin indent on

" ------------------
" My stuff
set bg=dark
" Windows compatibility
if has("win32")
  set term=pcansi
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

" Half fix for ConEmu on win10. Use -cur_console:p instead
"if
"  set t_ku=[A
"  set t_kd=[B
"  set t_kr=[C
"  set t_kl=[D
"endif

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
set virtualedit=onemore

syntax on
filetype indent on
set number
set cursorline
set wildmenu
set showmatch
set ruler laststatus=2 showcmd showmode

set switchbuf=usetab,newtab
"set showtabline=2

"Avoid temp files
set nobackup
set nowritebackup
set noswapfile
set noundofile

set mouse=a
let mapleader = "\<Space>"
nnoremap <Leader>q :qa<CR>
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
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>Y "+Y
nnoremap <Leader>D "+D
nnoremap <Leader>p "+gp
nnoremap <Leader>P "+gP
" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W
nnoremap <Leader><Tab> :tabedit 
nnoremap <Leader>t gt
" User Enter to open Unite
"nnoremap <CR> :Unite buffer file tab<CR>
nnoremap <CR> :CtrlPBuff<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" NerdTree
silent! nmap <F4> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
if executable("rg")
    set grepprg=rg\ --color=never
    if executable("tr") && !empty($CYGWIN)
        let g:ctrlp_user_command = 'rg $(cygpath -w %s) --files --color=never --glob ""  | tr -d "\r"'
    else
        let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    endif
    let g:ctrlp_use_caching = 0
endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"colorscheme solarized
colorscheme molokai
if has('gui_running')
  set guioptions-=T  " no toolbar
  "colorscheme industry
  set lines=50 columns=140 linespace=0
  if has('gui_win32')
    "set guifont=DejaVu_Sans_Mono:h9:cANSI
    set guifont=Consolas:h9:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif
endif

