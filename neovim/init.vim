" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" syntax enable
filetype plugin indent on
autocmd FileType python map <buffer> <F9> :w<CR> :split<CR> :ter python3 "%"<CR>
autocmd FileType rust map <buffer> <F9> :w<CR> :split<CR> :ter cargo run<CR>
autocmd FileType rust map <buffer> <F8> :w<CR> :split<CR> :ter cargo check<CR>
map <F5> :NERDTreeToggle<CR>
