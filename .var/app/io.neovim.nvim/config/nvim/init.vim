call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
call plug#end()
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
