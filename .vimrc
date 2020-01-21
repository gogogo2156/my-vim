
set nocompatible                " use vim defaults
set t_RV=                       " http://bugs.debian.org/608242
" set runtimepath=$VIMRUNTIME     " turn off user scripts, https://github.com/igrigorik/vimgolf/issues/129

syntax on                       " turn syntax highlighting on by default
filetype on                     " detect type of file
filetype indent on              " load indent file for specific file type

set nobackup                    " do not keep a backup file
set novisualbell                " turn off visual bell
set visualbell t_vb=            " turn off error beep/flash

set ruler                       " show the current row and column
set number                      " show line numbers
set relativenumber             " Show the line number relative to the line with the cursor in front of each line
set showcmd                     " display incomplete commands
set showmode                    " display current modes

set scrolloff=3                 " keep 3 lines when scrolling
set backspace=indent,eol,start  " make that backspace key work the way it should
set showmatch                   " jump to matches when entering parentheses
set matchtime=1                 " tenths of a second to show the matching parenthesis

set hlsearch                    " highlight searches
set incsearch                   " do incremental searching
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" Default indenting options
set expandtab smarttab
set autoindent smartindent shiftround
set shiftwidth=4 softtabstop=4 tabstop=4

" Identify invisible characters and don't show them by default
set list listchars=eol:¬,tab:▸\ ,trail:.,

set background=dark
