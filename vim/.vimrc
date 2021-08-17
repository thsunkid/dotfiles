syntax on
colorscheme monokai

set number
set incsearch
set hlsearch

set laststatus=2
set tabstop=4 shiftwidth=4 expandtab

nnoremap <esc><esc> :silent! nohls<cr>

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'

" Vim for ipython
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
let g:slime_target = "vim"


" netwr setup
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15


" Key mapping
nnoremap <S-w> <C-w>
nnoremap <C-l> :set nonu<CR>
nnoremap <esc><esc> :silent! nohls<cr>
nnoremap <S-p> "+p

vnoremap <S-p> "+p
vnoremap <S-y> "*y
inoremap <C-c> <ESC>"+pa
" map to action "undo in insert mode'
tnoremap <esc> <C-\><C-n>
" refresh vim
noremap <C-k><C-b> :Vex<CR>

" Initialize plugin system
call plug#end()
