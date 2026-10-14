execute pathogen#infect()
execute pathogen#helptags()

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

let NERDTreeDirArrows = 0
let g:tagbar_usearrows = 1

let g:pymode = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0

nnoremap <leader>l :TagbarToggle<CR>
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'sys']
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_options_max_line_length = 120
let g:pymode_lint_checkers = ['pep8']
let g:pymode_doc = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''

set laststatus=2
set t_Co=256
set noshowmode

if has('nvim')
  " lua require('init')
  colorscheme catppuccin-macchiato
  let g:airline_theme = 'catppuccin_macchiato'
else
  colorscheme catppuccin_macchiato
  set termguicolors
  let g:airline_theme = 'catppuccin_macchiato'
endif

let g:indent_guides_enable_on_vim_startup = 0
let g:clipboard = 'osc52'
