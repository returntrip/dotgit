" Plugins system start
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
" Markdown preview: do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 1
" `vim-markdown` settings
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 1
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" General Improvements
set mouse=a
set smartindent " indent based on language
set tabstop=4 " sets spaces number for tab
set undofile " activate undo also if vim was closed
set errorbells
set visualbell
