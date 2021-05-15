" Plugins will be downloaded under the specified directory.
colorscheme industry

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

filetype plugin indent on
autocmd FileType python map <buffer> <F9> :w<CR> :split<CR><C-W><C-W> :ter python3 "%"<CR> :startinsert <CR> 
autocmd FileType rust map <buffer> <F9> :w<CR> :split<CR><C-W><C-W> :ter cargo run<CR> :startinsert <CR>
autocmd FileType rust map <buffer> <F8> :w<CR> :split<CR><C-W><C-W> :ter cargo check<CR> :startinsert <CR> 
map <F5> :NERDTreeToggle<CR>

:set mouse=a
:set nu
let mapleader = ","

map <A-l> <C-w><C-w>
map <A-h> <C-w><C-w>

