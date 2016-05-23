execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=2
set softtabstop=0 expandtab
set shiftwidth=2


set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
  \   if &omnifunc == "" |
	\           setlocal omnifunc=syntaxcomplete#Complete |
	\   endif
endif


