" Plugins system start
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
call plug#end()
" Markdown preview: do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
" General Improvements
set mouse=a
set smartindent " indent based on language
set tabstop=4 " sets spaces number for tab
set undofile " activate undo also if vim was closed
set errorbells
set visualbell
