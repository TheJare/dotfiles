set nocompatible
set hidden

" ------------------
" Vundle stuff
" Necessary one-time manual bootstrap (if vim complains about this .vimrc):
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   then start vim and run :PluginInstall command
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Plugin 'altercation/vim-colors-solarized'
"Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'

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
vmap <Leader>y "+y
vmap <Leader>d "+d
"nmap <Leader>Y "+Y
"nmap <Leader>D "+D
vmap <Leader>p "+p
vmap <Leader>P "+P
" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W
nnoremap <Leader><Tab> :tabedit 
nnoremap <Leader>t gt
" User Enter to open Unite
"nnoremap <CR> :Unite buffer file tab<CR>
nnoremap <CR> :CtrlPBuff<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
if executable("ag")
    if executable("tr") && !empty($CYGWIN)
        let g:ctrlp_user_command = 'ag -l --nocolor -g "" $(cygpath -w %s) | tr -d "\r"'
    else
        let g:ctrlp_user_command = 'ag --hidden -l --nocolor -g "" %s'
    endif
    let g:ctrlp_use_caching = 0
endif

" CtrlSpace
" https://github.com/vim-ctrlspace/vim-ctrlspace
" set showtabline=0
" let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
" hi CtrlSpaceNormal guifg=#ffffff guibg=#000000 gui=bold ctermfg=yellow ctermbg=black
" hi CtrlSpaceSelected guifg=#800000 guibg=#000000 gui=bold ctermfg=black ctermbg=yellow term=bold cterm=bold
" if executable("ag")
"     if executable("tr")
"         let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g "" | tr -d "\r"'
"     else
"         let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
"     endif
" endif 

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
  "set lines=60 columns=108 linespace=0
  if has('gui_win32')
    "set guifont=DejaVu_Sans_Mono:h9:cANSI
    set guifont=Consolas:h9:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif
endif

" Cursor line highlight, only on active window
hi CursorLine cterm=NONE ctermbg=234 guibg=#101010
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Status line with color based on insert or readonly modes
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  else
    hi statusline guibg=Green ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

function! ReadonlyStatuslineColor()
  if &readonly
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    call InsertStatuslineColor(v:insertmode)
  endif
endfunction

augroup StatusLine
    au!
    au InsertEnter * call InsertStatuslineColor(v:insertmode)
    au InsertLeave * call InsertStatuslineColor('')
    "call InsertStatuslineColor('')
    au VimEnter,WinEnter,BufEnter * call ReadonlyStatuslineColor()
augroup END

" Formats the statusline
set statusline=%F\                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=\ \|%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*\|

set statusline+=\ %=                  " align left
set statusline+=\|\ L\ %l/%L            " line X of Y [percent of file]
set statusline+=\ C\ %c              " current column
set statusline+=\|\ Buf:%n              " Buffer number
set statusline+=\ Tab:%{tabpagenr()}  " Tab number
