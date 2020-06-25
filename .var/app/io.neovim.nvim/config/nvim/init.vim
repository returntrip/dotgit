"" Plugins system start
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
"" `vim-markdown` settings
let g:mkdp_auto_close = 1 " Markdown preview: do not close the preview tab when switching to other buffers
let g:vim_markdown_folding_disabled = 1 " disable header folding
let g:vim_markdown_conceal = 1 " do not use conceal feature, the implementation is not so good
let g:tex_conceal = "" " disable math tex conceal feature
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1  " font matter for YAML format
let g:vim_markdown_toml_frontmatter = 1  " font matter for TOML format
let g:vim_markdown_json_frontmatter = 1  " font matter for JSON format
"" General Improvements
set mouse=a
filetype plugin indent on " indentation base on file type
set tabstop=4 " sets spaces number for tab
set shiftwidth=4 " when indenting with '>', use 4 spaces width 
set expandtab " On pressing tab, insert 4 spaces
set undofile " activate undo also if vim was closed
set errorbells
set visualbell
"" Colors
set termguicolors "truecolor
colorscheme  torte
