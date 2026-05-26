syntax enable
set ai
set tabstop=4
set linebreak
set wrap

map <F7> :tabp<CR>
map <F8> :tabn<CR>

call plug#begin()

Plug 'lervag/vimtex'

call plug#end()

let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk_engines = {
	\ '_' : '-lualatex',
	\}
let g:vimtex_quickfix_open_on_warning = 0
