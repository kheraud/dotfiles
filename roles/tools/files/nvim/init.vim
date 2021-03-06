call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark='hard'

autocmd vimenter * ++nested colorscheme gruvbox
