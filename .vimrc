" Coloring tweaks
set background=dark
color koehler

" Don't create spammy files whenever a file is opened
set noswapfile
set nobackup

" Highlight the current line (current window only)
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" Show line numbers
set number

" Show 80-character limit
set colorcolumn=80

" Incremental highlighting search, smart case
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation and 4-space tabs
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Don't deselect visual block after indent/unindent
vnoremap < <gv
vnoremap > >gv

" Syntax highlighting & indent
syntax on
filetype plugin indent on

" Quickfix window shortcuts
map <C-Up> :cp<CR>
map <C-Down> :cn<CR>
map <C-Left> :colder<CR>
map <C-Right> :cnewer<CR>

" Shortcuts to favorite files
map <C-S-S> :e ~/scratch<cr>

" Ctrl-C/Ctrl-V/Ctrl-X for copy/paste/cut
map <C-c> "+y
map <C-x> "+ygvd
map <C-v> "+p
imap <C-v> <ESC>"+pa

" Install Pathogen
call pathogen#infect()

" Powerline config
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" NERDTree config
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.handlebars.js$','.svn$','.git$','.hg$','.pyc$']
let NERDTreeChDirMode  = 2
let NERDTreeQuitOnOpen = 1
map <F12> :NERDTreeToggle<cr>

" Tlist config
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
 let Tlist_Use_Right_Window = 1

" Ctrl-P config
set wildignore+=*.pyc,*.old,*.bak,*.handlebars.js,*.orig,*.py.orig,*/genfiles/*,genfiles/*
let g:ctrlp_working_path_mode = ''

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Local settings are defined in ~/.vimlocalsettings, example contents:
" let g:startup_project="PATH TO PROJECT DIR"

source $HOME/.vimlocalsettings
if exists("g:startup_project")
    cd `=g:startup_project`
endif
