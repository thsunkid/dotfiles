syntax on
filetype plugin indent on

set termguicolors


set laststatus=4
set tabstop=4 shiftwidth=4 expandtab
set nu

call plug#begin(".vim/plugged")

Plug 'sickill/vim-monokai'
Plug 'patstockwell/vim-monokai-tasty'

" colorscheme monokai

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf'
Plug 'gfanto/fzf-lsp.nvim'

" telescope: https://github.com/nvim-telescope/telescope.nvim#getting-started
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoreap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim utility elements
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'neovimhaskell/haskell-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}


" vim airline
Plug 'Badacadabra/vim-archery'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 


" Vim for ipython
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:vim_monokai_tasty_italic = 1


"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme = "wombat"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%p%% ln:%l'
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=0


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
" nnoremap <Tab> :vs \| :te<CR>

noremap <S-c> <C-c>
vnoremap <S-p> "+p
vnoremap <S-y> "*y
inoremap <C-c> <ESC>"+pa
inoremap jj <ESC>
" map to action "undo in insert mode'
tnoremap <esc> <C-\><C-n>
" refresh vim
noremap <F5> :so ~/.vimrc<CR>
noremap <C-k><C-b> :Vex<CR>

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" Initialize plugin system
call plug#end()
colorscheme monokai
