execute pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on
"let g:molokai_original = 1
colorscheme molokai

let mapleader=','
nnoremap \ ,

"set t_Co=16
"set background=dark

set ttimeout
set ttimeoutlen=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=1000		" keep 50 lines of command line history
set undofile
set undolevels=1000
set undoreload=1000
set undodir=$HOME/.vimundo/
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode
set incsearch		" do incremental searching
set hlsearch
set number
" Setting tabulator key to 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Allow to hide modified buffers.
set hidden

" Don't auto de-indent labels (std:)
set cinoptions+=L0
" Don't auto indent public: and private:
set cinoptions+=g0

" show wildmenu
set wildmenu
set wildmode=list:longest

" save temp-files in a central folder
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set ignorecase
set smartcase

set grepprg=grep\ -nH\ $*

" search in current directory and work up the tree towards root until one is
" found
set tags=.git/tags

" allow using the mouse
set mouse=a
" always show statusline
set laststatus=2

" fugitive status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" show invisible characters
set list
" som alternatives: tab:▸\,eol:¬
set listchars=tab:\|\ ,trail:…

" clear trailing spaces on save
autocmd BufWritePre * kz|:%s/\s\+$//e|'z

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    au BufRead,BufNewFile *.he  set filetype=c
    au BufRead,BufNewFile *.hdb  set filetype=c
    au BufRead,BufNewFile *.cu  set filetype=c

    au BufRead,BufNewFile *.moon set filetype=lua

    au FileType ruby nnoremap <leader>rr :!ruby %<CR>

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        "autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

    autocmd FileType ruby set sw=2 ts=2
    autocmd FileType lua set sw=2 ts=2
    autocmd FileType c set sw=2 ts=2

    au BufWinLeave *.* mkview
    au BufWinEnter *.* silent loadview

    " shortcut go to last active tab
    let g:lasttab = 1
    nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()

    au FileType python nnoremap <leader>rr :w<CR>:!python %<CR>
endif " has("autocmd")

" open NERDtree
map <Leader>n :NERDTreeToggle<CR>

" easy copy and paste with gui-clipboard
map <Leader>p "+p
map <Leader>P "+P
map <Leader>]p "+]p
map <Leader>]P "+]P
map <Leader>y "+y
vmap <Leader>y "+y
map <Leader>d "+d
vmap <Leader>d "+d

nmap <Leader>tn :tabnew<CR>

nmap <silent> <leader>+ :resize +4<CR>
nmap <silent> <leader>- :resize -4<CR>
nmap <silent> + :vertical resize +4<CR>
nmap <silent> - :vertical resize -4<CR>

map <silent> <Leader>cc :make %<Return>:cw<Return>
map <silent> <Leader>cp :cprevious<Return>
map <silent> <Leader>cn :cnext<Return>

" edit vimrc
map <silent> <Leader>rc :e ~/.vimrc<CR>
" load vimrc
map <silent> <Leader>rl :so ~/.vimrc<CR>

" map ' to ` and vice versa
nnoremap ' `
nnoremap ` '

" map to switch off hlsearch
nnoremap <silent> <leader>h :silent :nohlsearch<CR>

" center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" go to first tab
nnoremap <silent> g0 :tabfirst<CR>
" go to last tab
nnoremap <silent> g$ :tablast<CR>

" keep in visual-mode after shifting with >/<
vnoremap > >gv
vnoremap < <gv
" disable neo arrokeys in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Home> <nop>
inoremap <End> <nop>

"map ctags travelbuttons
nnoremap ) <C-]>
nnoremap ( <C-t>
